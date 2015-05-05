
module TwiMaster {

  //
  // Some things for compatibility at first, delete this eventually
  //
  +{
    #ifndef F_CPU
    #define F_CPU 2000000
    #endif

    #include <avr/io.h>
    #include <avr/interrupt.h>    
    #include <util/delay.h>

    #define TWI_BAUD(F_SYS, F_TWI) ((F_SYS / (2 * F_TWI)) - 5)

  }+
  
  public enum BusState { UNKNOWN   = 0x00, 
                         IDLE      = 0x01, 
                         OWNER     = 0x02, 
                         BUSY      = 0x03 }

  const uint8 WriteBufferSize = 15
  const uint8 ReadBufferSize = 1
  uint8 slaveAddress = 0x60
  byte writeData[WriteBufferSize] = {0}
  byte readData[ReadBufferSize]
  uint8 bytesToWrite = 0
  uint8 bytesToRead = 0
  uint8 bytesWritten = 0
  uint8 bytesRead = 0
  uint8 tState 
  uint8 tResult 

  public init() {
    +{ TWIC.MASTER.BAUD }+ = +{ TWI_BAUD(2000000, 100000) }+
    +{ TWIC.MASTER.CTRLA = TWI_MASTER_INTLVL_LO_gc | 
                           TWI_MASTER_RIEN_bm | 
                           TWI_MASTER_WIEN_bm | 
                           TWI_MASTER_ENABLE_bm }+
    +{ TWIC.MASTER.STATUS }+ = BusState.IDLE
  }

  public BusState getState() {
    return +{ TWIC.MASTER.STATUS & TWI_MASTER_BUSSTATE_gm }+
  }

  public bool ready() {
    return (tState & TwimState.READY) != 0
  }

  public bool write(uint8 address, uint8 [] data, uint8 dataLength) {
    return writeAndRead(address, data, dataLength, null, 0)
  }

  public bool read(uint8 address, uint8 [] data, uint8 dataLength) {
    return writeAndRead(address, null, 0, data, dataLength)
  }

  public bool writeAndRead(uint8 address, uint8 [] wdata, uint8 wdataLength, uint8 [] rdata, uint8 rdataLength) {
    if (wdataLength > WriteBufferSize) { return false }
    if (rdataLength > ReadBufferSize)  { return false }

    if (tState == TwimState.READY) {
      tState = TwimState.BUSY
      tResult = TwimResult.UNKNOWN
      slaveAddress = (address << 1)

      for (uint8 i = 0; i < wdataLength; i++) {
        writeData[i] = wdata[i]
      }

      bytesToWrite = wdataLength
      bytesToRead  = rdataLength
      bytesWritten = 0
      bytesRead = 0

      if (bytesToWrite > 0) {
        +{ TWIC.MASTER.ADDR }+ = slaveAddress & (~0x01)
      } elif (bytesToRead > 0) {
        +{ TWIC.MASTER.ADDR }+ = slaveAddress | 0x01
      }

      return true
    } 

    return false
  }

  /////////////////////////////////////////////////////////////////////////////
  // Private members
  /////////////////////////////////////////////////////////////////////////////

  enum TwimState { READY = 0, 
                   BUSY  = 1 }

  enum TwimResult { UNKNOWN          = 0x00,
                    OK               = 0x01,
                    BUFFER_OVERFLOW  = 0x02,
                    ARBITRATION_LOST = 0X03,
                    BUS_ERROR        = 0X04,
                    NACK_RECEIVED    = 0X05,
                    FAIL             = 0X06 }

  enum TwimStatus { BUS_ERROR        = 0x04, 
                    ARBITRATION_LOST = 0x08,
                    RECEIVE_ACK      = 0x10,
                    CLOCK_HOLD       = 0x20,
                    WRITE_INTERRUPT  = 0x40,
                    READ_INTERRUPT   = 0x80 }

  public interruptHandler() {
    uint8 status = +{ TWIC.MASTER.STATUS }+

    if ((status & TwimStatus.ARBITRATION_LOST) != 0 || (status & TwimStatus.BUS_ERROR) != 0) {
      arbitrationLostBusErrorHandler(status)
    }

    elif (status & TwimStatus.WRITE_INTERRUPT) { writeHandler() }  
    elif (status & TwimStatus.READ_INTERRUPT)  { readHandler()  }     
    else { transactionFinished(TwimResult.FAIL) }                 // unexpected state
  }

  arbitrationLostBusErrorHandler(TwimStatus status) {
    if (status == TwimStatus.BUS_ERROR) { 
      tResult = TwimResult.BUS_ERROR 
      +{ TWIC.MASTER.STATUS }+ |= TwimStatus.BUS_ERROR            // clear the flag
    } else { 
      tResult = TwimResult.ARBITRATION_LOST 
      +{ TWIC.MASTER.STATUS }+ |= TwimStatus.ARBITRATION_LOST     // clear the flag
    }

    tState = TwimState.READY
  }

  writeHandler() {

    // if NOT acknowledged (NACK) by slave, cancel the transaction
    if (+{ TWIC.MASTER.STATUS }+ & TwimStatus.RECEIVE_ACK) {
      +{ TWIC.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc }+
      transactionFinished(TwimResult.NACK_RECEIVED)
    }

    // if more bytes to write, send data
    elif (bytesWritten < bytesToWrite) {
      +{ TWIC.MASTER.DATA }+ = writeData[bytesWritten]
      bytesWritten++
    }

    // if bytes to read, send repeated START condition + address + R/_W = 1
    elif (bytesRead < bytesToRead) {
      +{ TWIC.MASTER.ADDR }+ = (slaveAddress | 0x01)
    }

    // if transaction finished, send STOP condition and set RESULT to OK
    else {
      +{ TWIC.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc }+
      transactionFinished(TwimResult.OK)
    }
  }

  readHandler() {

    // Fetch data if bytes to read
    if (bytesRead < ReadBufferSize) {
      readData[bytesRead] = +{ TWIC.MASTER.DATA }+
      bytesRead++
    } 

    // If buffer overflow, issue STOP and BUFFER_OVERFLOW condition
    else {
      +{TWIC.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc}+
      transactionFinished(TwimResult.BUFFER_OVERFLOW)
    }

    // If more bytes to read, issue ACK and start a byte read
    if (bytesRead < bytesToRead) {
      +{ TWIC.MASTER.CTRLC = TWI_MASTER_CMD_RECVTRANS_gc }+
    } 

    // If transaction finished, issue NACK and STOP condition
    else {
      +{ TWIC.MASTER.CTRLC = TWI_MASTER_ACKACT_bm | TWI_MASTER_CMD_STOP_gc }+
      transactionFinished(TwimResult.OK)
    }
  }

  transactionFinished(TwimResult result) {
    tResult = result
    tState = TwimState.READY
  }

}