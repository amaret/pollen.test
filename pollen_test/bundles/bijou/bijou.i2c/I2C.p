
import I2CProviderEfm32 as I2CProvider


module I2C {

  public enum MessageFlag { None = 0x00, Write = 0x01, Read = 0x02, NoStop = 0x04 }

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

    public setData(uint8 [] data) {
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
      if (transferMessage(@) != TransferResult.Done) {
        // Handle transfer error
      }
      @flags = MessageFlag.None
    }

    public read(uint16 length) {
      if (length > 0) {
        @length = length
        @flags |= MessageFlag.Read
        if (transferMessage(@) != TransferResult.Done) {
          // Handle transfer error
        }
        @flags = MessageFlag.None
      }
    }
  }

  ///////////////////////////////////////////////////////
  public enum TransferResult { Done, InProgress, Nack, BusError, ArbitrationLost, UsageFault, SwFault }
  
  enum TransferState  { Ready, 
                        SendStartAndAddress, 
                        WaitForAddressAckNack,
                        WaitForDataAckNack, 
                        SendData,
                        WaitForData,
                        WaitForStop,
                        Done
                      }

  uint8 tResult = TransferResult.Done
  uint8 tState = TransferState.Ready

  Message tMsg = null
  uint8 tMsgOffset = 0

  I2C() {
    I2CProvider.init()
  }

  // ------------------------------------------------------------------------//
  // Helper Transfer Method
  // ------------------------------------------------------------------------//

  uint8 transferMessage(Message msg) {
    uint8 ret = 0

    ret = i2c_TransferInit(msg)                    // start I2C read transaction            
    while (ret == TransferResult.InProgress) {     // continue until all data has been read
      ret = i2c_Transfer()    
    }     

    return ret
  }

  // ------------------------------------------------------------------------//
  // Main I2C Transfer State Machine Methods
  // ------------------------------------------------------------------------//

  uint8 i2c_TransferInit(Message msg) {

    if (tState != TransferState.Ready && tState != TransferState.Done) {                 
      return TransferResult.UsageFault 
    }        

    // Since this SW assumes single master, we can just issue an abort. The BUSY state is normal after a reset.
    I2CProvider.abort()

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

    I2CProvider.flush()                 // Ensure buffers are empty 
    I2CProvider.enable(true)            // Enable I2C transfers 
    
    uint8 ret = i2c_Transfer()   // Start transfer        
    return ret
  }

  uint8 i2c_Transfer() {
    
    for (;;) {
      if (errorsPending()) { 
        tState = TransferState.Done
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

  // ------------------------------------------------------------------------//
  // State Machine States 
  // ------------------------------------------------------------------------//

  bool errorsPending() {
     uint8 errors = I2CProvider.getErrors()

     if (errors & TransferResult.ArbitrationLost) {
      tResult = TransferResult.ArbitrationLost
     } elif (errors & TransferResult.BusError) {
      tResult = TransferResult.BusError
     }

     return errors != 0
  }

  //------------------------------------------------
  // Send first start+address (first byte if 10 bit) 
  //------------------------------------------------
  sendStartAndAddress() {
    uint8 tmp

    tmp = tMsg.address << 1

    if (tMsg.flags & MessageFlag.Read) { 
      tmp |= 1  // Indicate read request 
    }        

    tState = TransferState.WaitForAddressAckNack 
    I2CProvider.put(tmp)            // Data not transmitted until START sent 
    I2CProvider.start()             // Send start..
  }

  //------------------------------------------------
  // Wait for Address ACK/NACK on data or address 
  //------------------------------------------------

  bool waitForAddressAckNack() {
    if (I2CProvider.gotNack()) {
      I2CProvider.clearNack()
      tResult = TransferResult.Nack
      tState  = TransferState.WaitForStop
      I2CProvider.stop()

    } elif (I2CProvider.gotAck()) {
      I2CProvider.clearAck()
      
      if (tMsg.flags & MessageFlag.Read) {    // Determine whether receiving or sending data
        tState = TransferState.WaitForData  
        if (tMsg.length == 1) {  // if reading, send nack
          I2CProvider.nack()
        }
      } else {
        tState = TransferState.SendData
        return false
      }
    }

    return true
  }

  //------------------------------------------------
  // Wait for ACK/NACK on data or address 
  //------------------------------------------------

  bool waitForDataAckNack() {
    if (I2CProvider.gotNack()) {
      I2CProvider.clearNack()
      tResult = TransferResult.Nack
      tState  = TransferState.WaitForStop
      I2CProvider.stop()
      return true
    } elif (I2CProvider.gotAck()) {
      I2CProvider.clearAck()
      tState = TransferState.SendData
      return false
    }    
  }


  //------------------------------------------------
  // Send a data byte to slave 
  //------------------------------------------------
  bool sendData() {
    if (tMsgOffset >= tMsg.length) {              // Reached end of data buffer?   
      if (tMsg.flags & MessageFlag.Write) {
        if (tMsg.flags & MessageFlag.NoStop) {    
          tState = TransferState.Done            // Skip sending of STOP condition, next send will have a repeated start
        } else {
          tState = TransferState.WaitForStop
          I2CProvider.stop()
        }

        return true
      }

      return false    // reprocess in case next buffer is empty
    }
    
    byte b = tMsg.data[tMsgOffset++]
    I2CProvider.put(b)     // Send byte     
    tState = TransferState.WaitForDataAckNack

    return true
  }

  //------------------------------------------------
  // Wait for data from slave 
  //------------------------------------------------
  waitForData() {
    if (I2CProvider.hasData()) {
      uint8 data
      uint8 rxLen = tMsg.length
      
      data = I2CProvider.get()       // Must read out data in order to not block further progress 
      
      if (tMsgOffset < rxLen) {      // Make sure not storing beyond end of buffer just in case 
        tMsg.data[tMsgOffset++] = data
      }
      
      if (tMsgOffset >= rxLen) {      // If we have read all requested data, then the sequence should end 
        if (rxLen == 1) {             // If there is only one byte to receive we need to transmit the
          I2CProvider.nack()          // NACK now, before the stop.
        }
        
        if (tMsg.flags & MessageFlag.NoStop) {          
          tState = TransferState.Done         // We SKIP the stop condition here          
        } else {
          tState = TransferState.WaitForStop
          I2CProvider.stop()
        }

      } else {        
        I2CProvider.ack()                   // Send ACK and wait for next byte

        if ( (rxLen > 1) && (tMsgOffset == (rxLen-1)) ) {
          // If there is more than one byte to receive and this is the next to last
          // byte we need to transmit the NACK now, before receiving the last byte.
          I2CProvider.nack()          
        }
      }
    }    
  }

  //------------------------------------------------
  // Wait for STOP to have been sent 
  //------------------------------------------------
  waitForStop() {
    if (I2CProvider.gotStop()) {
      I2CProvider.clearStop()
      tState = TransferState.Done
    }    
  }

  //------------------------------------------------
  // Action taken in done state 
  //------------------------------------------------
  doneState() {    
    I2CProvider.enable(false)     // Disable I2C when transmission complete (disable interrupts)
    if (tResult == TransferResult.InProgress) {
      tResult = TransferResult.Done
    }    
  }


}