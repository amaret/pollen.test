

module I2CProviderEFM32 {
  
  // Clock High To Low Ratios
  enum ClockHLR { Standard, Asymetric, Fast }


  // enable 

  // 
  // Prepare and start an I2C transfer (single master mode only).
  //
  uint8 transferInit(I2C.Message msg) {

    // Check if in busy state. Since this SW assumes single master, we can 
    // just issue an abort. The BUSY state is normal after a reset. 
    if (+{I2C0->STATE & I2C_STATE_BUSY}+) {
      +{ I2C0->CMD = I2C_CMD_ABORT }+
    }

    // Make sure user is not trying to read 0 bytes, it is not possible 
    // according to I2C spec, since slave will always start sending first byte
    // ACK on address. The read operation can only be stopped by NACKing a 
    // received byte, ie minimum 1 byte. 
    if (((seq->flags & I2C_FLAG_READ) && !(seq->buf[0].len)) ||
        ((seq->flags & I2C_FLAG_WRITE_READ) && !(seq->buf[1].len))) {
      return(i2cTransferUsageFault);
    }

    // Prepare for a transfer 
    transfer->state   = i2cStateStartAddrSend;
    transfer->result  = i2cTransferInProgress;
    transfer->offset  = 0;
    transfer->bufIndx = 0;
    transfer->seq     = seq;

    // Ensure buffers are empty 
    i2c->CMD = I2C_CMD_CLEARPC | I2C_CMD_CLEARTX;
    if (i2c->IF & I2C_IF_RXDATAV) {
      (void)i2c->RXDATA;
    }

    // Clear all pending interrupts prior to starting transfer.
    i2c->IFC = _I2C_IFC_MASK;

    // Enable those interrupts we are interested in throughout transfer. Notice
    // that the I2C interrupt must also be enabled in the NVIC, but that is 
    // left for an additional driver wrapper.
    i2c->IEN = I2C_IF_NACK | I2C_IF_ACK | I2C_IF_MSTOP | I2C_IF_RXDATAV | I2C_IF_ERRORS;

    return transfer(msg)   // Start transfer
  }

  uint8 transferState = 0
  uint8 transferResult = 0


  bool errorPending(uint32 flags) {
    bool error = false

    // If some sort of fault, abort transfer.
    if (pending & I2C_IF_ERRORS) {
      if (pending & I2C_IF_ARBLOST) {
        // If arbitration fault, it indicates either a slave device 
        // not responding as expected, or other master which is not 
        // supported by this SW.
        transferResult = ArbitrationLost_R;
      } else if (pending & I2C_IF_BUSERR) {
        // A bus error indicates a misplaced start or stop, which should 
        // not occur in master mode controlled by this SW. 
        transferResult = BusError_R;
      }

      // If error situation occurred, it is difficult to know 
      // exact cause and how to resolve. It will be up to a wrapper 
      // to determine how to handle a fault/recovery if possible.
      transferState = StateDone_S;
      error = true      
    }

    return error
  }

  
  transfer(I2C.Message msg) {
    uint32 tmp
    uint32 pending

    for (;;) { 
      pending = +{I2C0->IF}+

      if (errorPending(pending)) {
        stateDone()
        return
      }

      switch (transferState) {
        /***************************************************/
        /* Send first start+address (first byte if 10 bit) */
        /***************************************************/
        case SendStartAndAddress_S:
          stateSendStartAndAddress(msg.address, /* Read = true, Write = false */ );
          break;

        /*******************************************************/
        /* Wait for ACK/NACK on address (first byte if 10 bit) */
        /*******************************************************/
        case i2cStateAddrWFAckNack:
          if (pending & I2C_IF_NACK)
          {
            i2c->IFC         = I2C_IFC_NACK;
            transfer->result = i2cTransferNack;
            transfer->state  = i2cStateWFStopSent;
            i2c->CMD         = I2C_CMD_STOP;
          }
          else if (pending & I2C_IF_ACK)
          {
            i2c->IFC = I2C_IFC_ACK;

            /* If 10 bit address, send 2nd byte of address. */
            if (seq->flags & I2C_FLAG_10BIT_ADDR)
            {
              transfer->state = i2cStateAddrWF2ndAckNack;
              i2c->TXDATA     = (uint32_t)(seq->addr) & 0xff;
            }
            else
            {
              /* Determine whether receiving or sending data */
              if (seq->flags & I2C_FLAG_READ)
              {
                transfer->state = i2cStateWFData;
                if(seq->buf[transfer->bufIndx].len==1)
                {
                  i2c->CMD  = I2C_CMD_NACK;
                }
              }
              else
              {
                transfer->state = i2cStateDataSend;
                continue;
              }
            }
          }
          goto done;

        /******************************************************/
        /* Wait for ACK/NACK on second byte of 10 bit address */
        /******************************************************/
        case i2cStateAddrWF2ndAckNack:
          if (pending & I2C_IF_NACK)
          {
            i2c->IFC         = I2C_IFC_NACK;
            transfer->result = i2cTransferNack;
            transfer->state  = i2cStateWFStopSent;
            i2c->CMD         = I2C_CMD_STOP;
          }
          else if (pending & I2C_IF_ACK)
          {
            i2c->IFC = I2C_IFC_ACK;

            /* If using plain read sequence with 10 bit address, switch to send */
            /* repeated start. */
            if (seq->flags & I2C_FLAG_READ)
            {
              transfer->state = i2cStateRStartAddrSend;
            }
            /* Otherwise expected to write 0 or more bytes */
            else
            {
              transfer->state = i2cStateDataSend;
            }
            continue;
          }
          goto done;

        /*******************************/
        /* Send repeated start+address */
        /*******************************/
        case i2cStateRStartAddrSend:
          if (seq->flags & I2C_FLAG_10BIT_ADDR)
          {
            tmp = ((seq->addr >> 8) & 0x06) | 0xf0;
          }
          else
          {
            tmp = seq->addr & 0xfe;
          }

          /* If this is a write+read combined sequence, then read is about to start */
          if (seq->flags & I2C_FLAG_WRITE_READ)
          {
            /* Indicate read request */
            tmp |= 1;
          }

          transfer->state = i2cStateRAddrWFAckNack;
          /* We have to write START cmd first since repeated start, otherwise */
          /* data would be sent first. */
          i2c->CMD    = I2C_CMD_START;
          i2c->TXDATA = tmp;
          goto done;

        /**********************************************************************/
        /* Wait for ACK/NACK on repeated start+address (first byte if 10 bit) */
        /**********************************************************************/
        case i2cStateRAddrWFAckNack:
          if (pending & I2C_IF_NACK)
          {
            i2c->IFC         = I2C_IFC_NACK;
            transfer->result = i2cTransferNack;
            transfer->state  = i2cStateWFStopSent;
            i2c->CMD         = I2C_CMD_STOP;
          }
          else if (pending & I2C_IF_ACK)
          {
            i2c->IFC = I2C_IFC_ACK;

            /* Determine whether receiving or sending data */
            if (seq->flags & I2C_FLAG_WRITE_READ)
            {
              transfer->state = i2cStateWFData;
            }
            else
            {
              transfer->state = i2cStateDataSend;
              continue;
            }
          }
          goto done;

        /*****************************/
        /* Send a data byte to slave */
        /*****************************/
        case i2cStateDataSend:
          /* Reached end of data buffer? */
          if (transfer->offset >= seq->buf[transfer->bufIndx].len)
          {
            /* Move to next message part */
            transfer->offset = 0;
            transfer->bufIndx++;

            /* Send repeated start when switching to read mode on 2nd buffer */
            if (seq->flags & I2C_FLAG_WRITE_READ)
            {
              transfer->state = i2cStateRStartAddrSend;
              continue;
            }

            /* Only writing from one buffer, or finished both buffers */
            if ((seq->flags & I2C_FLAG_WRITE) || (transfer->bufIndx > 1))
            {
              transfer->state = i2cStateWFStopSent;
              i2c->CMD        = I2C_CMD_STOP;
              goto done;
            }

            /* Reprocess in case next buffer is empty */
            continue;
          }

          /* Send byte */
          i2c->TXDATA     = (uint32_t)(seq->buf[transfer->bufIndx].data[transfer->offset++]);
          transfer->state = i2cStateDataWFAckNack;
          goto done;

        /*********************************************************/
        /* Wait for ACK/NACK from slave after sending data to it */
        /*********************************************************/
        case i2cStateDataWFAckNack:
          if (pending & I2C_IF_NACK)
          {
            i2c->IFC         = I2C_IFC_NACK;
            transfer->result = i2cTransferNack;
            transfer->state  = i2cStateWFStopSent;
            i2c->CMD         = I2C_CMD_STOP;
          }
          else if (pending & I2C_IF_ACK)
          {
            i2c->IFC        = I2C_IFC_ACK;
            transfer->state = i2cStateDataSend;
            continue;
          }
          goto done;

        /****************************/
        /* Wait for data from slave */
        /****************************/
        case i2cStateWFData:
          if (pending & I2C_IF_RXDATAV)
          {
            uint8_t       data;
            unsigned int  rxLen = seq->buf[transfer->bufIndx].len;

            /* Must read out data in order to not block further progress */
            data = (uint8_t)(i2c->RXDATA);

            /* Make sure not storing beyond end of buffer just in case */
            if (transfer->offset < rxLen)
            {
              seq->buf[transfer->bufIndx].data[transfer->offset++] = data;
            }

            /* If we have read all requested data, then the sequence should end */
            if (transfer->offset >= rxLen)
            {
              /* If there is only one byte to receive we need to transmit the
                 NACK now, before the stop. */
              if (1 == rxLen)
              {
                i2c->CMD  = I2C_CMD_NACK;
              }
                
              transfer->state = i2cStateWFStopSent;
              i2c->CMD        = I2C_CMD_STOP;
            }
            else
            {
              /* Send ACK and wait for next byte */
              i2c->CMD = I2C_CMD_ACK;

              if ( (1<rxLen) && (transfer->offset == (rxLen-1)) )
              {
                /* If there is more than one byte to receive and this is the next
                   to last byte we need to transmit the NACK now, before receiving
                   the last byte. */
                i2c->CMD  = I2C_CMD_NACK;
              }
            }
          }
          goto done;

        /***********************************/
        /* Wait for STOP to have been sent */
        /***********************************/
        case i2cStateWFStopSent:
          if (pending & I2C_IF_MSTOP)
          {
            i2c->IFC        = I2C_IFC_MSTOP;
            transfer->state = i2cStateDone;
          }
          goto done;

        /******************************/
        /* Unexpected state, SW fault */
        /******************************/
        default:
          transfer->result = i2cTransferSwFault;
          transfer->state  = i2cStateDone;
          goto done;
      }
    }


  done:

    if (transferState != StateDone_S) {      
      return TransferInProgress_R    // Until transfer is done keep returning TransferInProgress 
    }

    return msg.result      
  }


  /////////////////////////////////////////////////////////////////////////////


  ///////////////////////////////////////////////////
  // Send first start+address (first byte if 10 bit) 
  ///////////////////////////////////////////////////
  
  stateSendStartAndAddress(uint8_t addr, bool read) {
    if (read) {      
      addr |= 0x01;     // Indicate read request 
    }

    transferState = WaitForAddressAckNack_S;
    I2C0->TXDATA     = addr             // Data not transmitted until START sent
    I2C0->CMD        = I2C_CMD_START
  }


  //////////////////////////////////////////////////////////
  // Wait for ACK/NACK on address (first byte if 10 bit) 
  //////////////////////////////////////////////////////////

  stateWaitForAddressAckNack(uint32 pending, bool read) {
    if (pending & I2C_IF_NACK) {
      I2C0->IFC         = I2C_IFC_NACK;
      transferResult = TransferNack_R;
      transferState  = WaitForStopSent_S;
      i2c->CMD         = I2C_CMD_STOP;
    }

    else if (pending & I2C_IF_ACK) {
      I2C0->IFC = I2C_IFC_ACK

      // Determine whether receiving or sending data */
      if (read) {
        transferState = WaitForData_S;

        // if only one byte in buffer, Send NACK now..
        if (seq->buf[transfer->bufIndx].len==1) {
          i2c->CMD  = I2C_CMD_NACK;
        }
      }
      else {
        transferState = DataSend_S;
      }    
    }
  }


  stateDone() {
    i2c->IEN = 0;                         // Disable interrupt sources when done 

    if (transferResult == TransferInProgress_R) {
      transferResult = TransferDone_R     // Update result unless some fault already occurred 
    }
  }

  /////////////////////////////////////////////////////////////////////////////
  // Private 

    uint8 transferState
    uint8 transferResult
    uint8 transferOffset
    uint8 transferIndex   //  index of the current buffer to use (incoming or outgoing) (something like 0, or 1)



  // Interrupt Clear
  // Interrupt Disable
  // Interrupt Enable
  // Interrupt Get
  // Interrupt Set


}