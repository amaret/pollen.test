// Other flags used for controlling aspects of the tranfser: 
// #define I2C_M_RD    0x0001  /* read data, from slave to master */
// #define I2C_M_RD    0x0001  /* read data, from slave to master */
// #define I2C_M_IGNORE_NAK  0x1000  /* if I2C_FUNC_PROTOCOL_MANGLING */
// #define I2C_M_NO_RD_ACK   0x0800  /* if I2C_FUNC_PROTOCOL_MANGLING */
// #define I2C_M_NOSTART   0x4000  /* if I2C_FUNC_NOSTART */
// #define I2C_M_REV_DIR_ADDR  0x2000  /* if I2C_FUNC_PROTOCOL_MANGLING */
// #define I2C_M_STOP    0x8000  /* if I2C_FUNC_PROTOCOL_MANGLING */

import pollen.environment as Bijou
from Bijou import Led0
from Bijou import Led1

module I2CDirect {
  
  public enum MessageFlag { None = 0x00, Write = 0x01, Read = 0x02, NoStop = 0x04}

  class Message {
    uint8 address = 0
    uint8 flags = 0
    uint16 length = 0
    uint8 data [] = null         // I cannot declare this as uint8 [] data

    public host Message(uint8 address) {
      @address = address
    }

    public setAddress(uint8 address) {
      @address = address
    }

    public uint8 getAddress() { 
      return @address 
    }

    public setData(byte [] data) {
      @data = data
    }

    public byte [] getData() {
      return @data
    }

    public Message addFlag(uint8 flag) {
      @flags |= flag
      return @
    }

    public write(uint16 length) {
      @length = length
      @flags |= MessageFlag.Write
      transferMessage(@)
      @flags = MessageFlag.None
    }

    public read(uint16 length) {
      if (length > 0) {
        @length = length
        @flags |= MessageFlag.Read
        transferMessage(@)        
        @flags = MessageFlag.None
      }
    }

  }

  // +{ void I2C0_IRQHandler(void) { `i2c_irq`(); } }+

  // i2c_irq() {
  //   // Just run the I2C_Transfer function that checks interrupts flags and returns the appropriate status 
  //   uint8 status = i2c_Transfer()
  // }

  uint16 transferMessage(Message msg) {
    uint8 ret = 0

    ret = i2c_TransferInit(msg)                    // start I2C read transaction            
    while (ret == TransferResult.InProgress) {     // continue until all data has been read
      ret = i2c_Transfer()    
    }     

    return ret
  }

  public init() {
    +{
      // #define I2C_PORT    gpioPortE // PORTE - I2C0 Location #6
      // #define I2C_SDA_PIN 12 // PE12  // EXP16
      // #define I2C_SCL_PIN 13 // PE13  // EXP15
      #define I2C_PORT    gpioPortD // PORTD - I2C0 Location #1
      #define I2C_SDA_PIN 6 // PD6 
      #define I2C_SCL_PIN 7 // PD7 

      CMU_ClockEnable(cmuClock_HFPER, true);                            // enable HF peripheral clock
      CMU_ClockEnable(cmuClock_GPIO, true);                             // enable GPIO peripheral clock
      CMU_ClockEnable(cmuClock_I2C0, true);                             // enable I2C0 peripheral clock

      // configure SDA and SCL as open drain output with pullups
      GPIO->P[I2C_PORT].MODEL = GPIO_P_MODEL_MODE6_WIREDAND | GPIO_P_MODEL_MODE7_WIREDAND;
      //      GPIO->P[I2C_PORT].MODEH = (10 << 20) | (10 << 16); 
      //      GPIO->P[I2C_PORT].MODEH = (8 << 20) | (8 << 16);       
      GPIO->P[I2C_PORT].DOUTSET = (1 << I2C_SCL_PIN) | (1 << I2C_SDA_PIN);    // initialize SDA and SCL high

      I2C0->IEN = 0;
      I2C0->IFC = _I2C_IFC_MASK;
      //I2C0->CTRL = I2C_CTRL_AUTOACK;    // enable auto ack
    }+
    
    setBusFreq(400000)  // set to ~400kHz

    +{ 
      //I2C0->ROUTE = (6 << 8) | 0x3;       // Route location 6
      I2C0->ROUTE = I2C_ROUTE_LOCATION_LOC1 | I2C_ROUTE_SDAPEN | I2C_ROUTE_SCLPEN;
      I2C0->CTRL |= I2C_CTRL_EN;      // enable

      /* Clear and enable interrupt from I2C module */
      //NVIC_ClearPendingIRQ(I2C0_IRQn);
      //NVIC_EnableIRQ(I2C0_IRQn);
    }+
  }


  setBusFreq(uint32 freq) {
    //I2C0->CTRL |= I2C_CTRL_CLHR_STANDARD;         // 4:4 ratio
    +{ I2C0->CTRL |= I2C_CTRL_CLHR_ASYMMETRIC }+    // 6:3 ratio
    //    +{ I2C0->CLKDIV = 2 }+                          // Gets close to 400kHz
    +{ I2C0->CLKDIV = 1 }+                          // Gets close to 400kHz
  }

  //////////////////////////////////////////////////
  // Private functions 
  //////////////////////////////////////////////////

  enum TransferResult { Done, InProgress, Nack, BusError, ArbitrationLost, UsageFault, SwFault }
  enum TransferState  { Ready, 
                        SendStartAndAddress, 
                        WaitForAddressAckNack, 
                        SendRepeatedStartAndAddress, 
                        WaitForRepeatedStartAddressAckNack,
                        SendData,
                        WaitForDataAckNack,
                        WaitForData,
                        WaitForStop,
                        Done
                      }

  uint8 tResult = TransferResult.Done
  uint8 tState = TransferState.Ready
  uint32 tPending = 0

  Message tMsg = null
  uint8 tMsgOffset = 0

  uint8 i2c_TransferInit(Message msg) {

    if (tState != TransferState.Ready && tState != TransferState.Done) {                 
      return TransferResult.UsageFault 
    }        

    // Check if in busy state. Since this SW assumes single master, we can 
    // just issue an abort. The BUSY state is normal after a reset. 
    if ( +{I2C0->STATE & I2C_STATE_BUSY}+ ) {
      +{ I2C0->CMD = I2C_CMD_ABORT }+
    }

    // Make sure user is not trying to read 0 bytes, it is not possible 
    // according to I2C spec, since slave will always start sending first
    // byte ACK on address. The read operation can only be stopped by 
    // NACKing a received byte, ie minimum 1 byte. 
    if ((msg.flags & MessageFlag.Read) && (msg.length == 0)) {      
      return TransferResult.UsageFault
    }

    // Prepare for a transfer
    tMsg = msg
    tMsgOffset = 0
    tState  = TransferState.SendStartAndAddress
    tResult = TransferResult.InProgress

    // Ensure buffers are empty 
    +{ I2C0->CMD = I2C_CMD_CLEARPC | I2C_CMD_CLEARTX }+

    if ( +{I2C0->IF & I2C_IF_RXDATAV}+ ) {
      +{ (void)I2C0->RXDATA }+
    }

    // Clear all pending interrupts prior to starting transfer.
    +{ I2C0->IFC = _I2C_IFC_MASK }+

    // Enable those interrupts we are interested in throughout transfer. Notice
    // that the I2C interrupt must also be enabled in the NVIC, but that is 
    // left for an additional driver wrapper. 
    +{ I2C0->IEN = I2C_IF_NACK | I2C_IF_ACK | I2C_IF_MSTOP | I2C_IF_RXDATAV | I2C_IF_ARBLOST | I2C_IF_BUSERR }+

    
    uint8 ret = i2c_Transfer()   // Start transfer        
    return ret
  }


  bool errorsPending() {     
    if ((tPending & +{ I2C_IF_ARBLOST }+) || (tPending & +{ I2C_IF_BUSERR }+))  {            // If some sort of fault, abort transfer.
      if (tPending & +{ I2C_IF_ARBLOST }+) {
        // If arbitration fault, it indicates either a slave device not responding
        // as expected, or other master which is not supported by this SW.
        tResult = TransferResult.ArbitrationLost
      }
      elif (tPending & +{ I2C_IF_BUSERR }+) {
        // A bus error indicates a misplaced start or stop, which should not occur
        // in master mode controlled by this SW.
        tResult = TransferResult.BusError
      }

      // If error situation occurred, it is difficult to know exact cause and how to
      // resolve. It will be up to a wrapper to determine how to handle a 
      // fault/recovery if possible.
      tState = TransferState.Done
      return true
    }    
    return false
  }

  //*************************************************
  // Send first start+address (first byte if 10 bit) 
  //*************************************************

  sendStartAndAddress() {
    uint8 tmp

    tmp = tMsg.address << 1

    if (tMsg.flags & MessageFlag.Read) { 
      tmp |= 1  // Indicate read request 
    }        

    tState = TransferState.WaitForAddressAckNack 

    +{ I2C0->TXDATA }+ = tmp                  // Data not transmitted until START sent 
    +{ I2C0->CMD }+    = +{ I2C_CMD_START }+  // Send start..
  }

  //*****************************************************
  // Wait for ACK/NACK on address (first byte if 10 bit) 
  //*****************************************************
  bool waitForAddressAckNack() {
    if (tPending & +{ I2C_IF_NACK }+) {
      +{ I2C0->IFC = I2C_IFC_NACK }+
      tResult = TransferResult.Nack
      tState  = TransferState.WaitForStop
      +{ I2C0->CMD = I2C_CMD_STOP }+

    } elif (tPending & +{ I2C_IF_ACK }+) {
      +{ I2C0->IFC = I2C_IFC_ACK }+
      
      if (tMsg.flags & MessageFlag.Read) {    // Determine whether receiving or sending data
        tState = TransferState.WaitForData  
        if (tMsg.length == 1) {  // if reading, send nack
          +{ I2C0->CMD  = I2C_CMD_NACK }+     // NOT SURE THIS NEEDS TO BE HERE!!!!
        }
      }
      else {
        tState = TransferState.SendData
        return false
      }
    }

    return true
  }

  //***************************
  // Send a data byte to slave 
  //***************************
  bool sendData() {

    
    if (tMsgOffset >= tMsg.length) {      // Reached end of data buffer?   

      if (tMsg.flags & MessageFlag.Write) {
        if (tMsg.flags & MessageFlag.NoStop) {
          tState = TransferState.Done 
          // We SKIP the stop condition here
        } else {
          tState = TransferState.WaitForStop
          +{ I2C0->CMD = I2C_CMD_STOP }+
        }
        return true
      }

      // Reprocess in case next buffer is empty 
      return false
    }

    // Send byte     
    +{ I2C0->TXDATA }+ = tMsg.data[tMsgOffset++]
    tState = TransferState.WaitForDataAckNack

    return true
  }

  //*******************************************************
  // Wait for ACK/NACK from slave after sending data to it 
  //*******************************************************
  bool waitForDataAckNack() {
    if (tPending & +{ I2C_IF_NACK }+) {
      +{ I2C0->IFC = I2C_IFC_NACK }+
      tResult = TransferResult.Nack
      tState  = TransferState.WaitForStop
      +{ I2C0->CMD = I2C_CMD_STOP }+
      return true
    }
    elif (tPending & +{ I2C_IF_ACK }+) {
      +{ I2C0->IFC = I2C_IFC_ACK }+
      tState = TransferState.SendData
      return false
    }
  } 

  //**************************
  // Wait for data from slave 
  //**************************
  waitForData() {
    if (tPending & +{ I2C_IF_RXDATAV }+ ) {
      uint8 data
      uint8 rxLen = tMsg.length
      
      data = +{ I2C0->RXDATA }+         // Must read out data in order to not block further progress 
      
      if (tMsgOffset < rxLen) {      // Make sure not storing beyond end of buffer just in case 
        tMsg.data[tMsgOffset++] = data
      }
      
      if (tMsgOffset >= rxLen) {      // If we have read all requested data, then the sequence should end 
        if (rxLen == 1) {             // If there is only one byte to receive we need to transmit the
          +{ I2C0->CMD  = I2C_CMD_NACK }+   // NACK now, before the stop. */
        }
        
        if (tMsg.flags & MessageFlag.NoStop) {          
          tState = TransferState.Done 
          // We SKIP the stop condition here
        } else {
          tState = TransferState.WaitForStop
          +{ I2C0->CMD = I2C_CMD_STOP }+
        }

      } else {        
        +{ I2C0->CMD = I2C_CMD_ACK }+       // Send ACK and wait for next byte

        if ( (rxLen > 1) && (tMsgOffset == (rxLen-1)) ) {
          // If there is more than one byte to receive and this is the next to last
          // byte we need to transmit the NACK now, before receiving the last byte.
          +{ I2C0->CMD  = I2C_CMD_NACK }+
        }
      }
    }    
  }

  //*********************************
  // Wait for STOP to have been sent 
  //*********************************
  waitForStop() {
    if (tPending & +{ I2C_IF_MSTOP }+) {
      +{ I2C0->IFC = I2C_IFC_MSTOP }+
      tState = TransferState.Done
    }    
  }

  doneState() {    
    +{ I2C0->IEN }+ = 0     // Disable interrupt sources when done 
    tPending = 0
    if (tResult == TransferResult.InProgress) {
      tResult = TransferResult.Done
    }    
  }

  uint8 i2c_Transfer() {
    
    for (;;) {
      tPending = +{ I2C0->IF }+

      if (errorsPending()) { 
        doneState()
        return tResult 
      }      

      switch (tState) {

        case TransferState.SendStartAndAddress:          
          sendStartAndAddress()          
          return TransferResult.InProgress          

        case TransferState.WaitForAddressAckNack:
          if (waitForAddressAckNack()) {
            return TransferResult.InProgress
          }
          break

        // case TransferState.SendRepeatedStartAndAddress:
        //   sendRepeatedStartAndAddress()
        //   return TransferResult.InProgress

        // case TransferState.WaitForRepeatedStartAddressAckNack:
        //   if (waitForRepeatedStartAddressAckNack()) {
        //     return TransferResult.InProgress
        //   }
        //   break

        case TransferState.SendData: 
          if (sendData()) {
            return TransferResult.InProgress
          }
          break

        case TransferState.WaitForDataAckNack: 
          if (waitForDataAckNack()) { 
            return TransferResult.InProgress
          }
          break

        case TransferState.WaitForData:
          waitForData()
          return TransferResult.InProgress

        case TransferState.WaitForStop:
          waitForStop()
          doneState()
          return TransferResult.Done          

        case TransferState.Done:
          doneState()
          return TransferResult.Done

        default:
          // Unexpected state, SW fault 
          tResult = TransferResult.SwFault
          tState = TransferState.Done
          return tResult      
      }
    }
  }

}