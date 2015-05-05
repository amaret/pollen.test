import Cpu

meta { string twiInterface }        // on xmega16c4 this can be TWIC or TWIE

module TwiMasterMeta {

  // Transaction status and result defines.
  enum TwiMasterStatus { READY = 0, BUSY = 1 }

  enum TwiMasterResult { UNKNOWN          = 0,
                         OK               = 1, 
                         BUFFER_OVERFLOW  = 2,
                         ARBITRATION_LOST = 3,
                         BUS_ERROR        = 4,
                         NACK_RECEIVED    = 5,
                         FAIL             = 6 }

  enum TwiSpeed { LOW      = 0,     // 10kHz
                  STANDARD = 1,     // 100kHz
                  FAST     = 2,     // 400kHz
                  FASTPLUS = 3 }    // 1MHz


  host uint8 twiSpeed = TwiSpeed.STANDARD  
  host uint8 speedRegValue = 0          // precomputed register value
  uint8 slaveAddress                    // Slave address 
  
  // Buffer size defines
  host uint8 WriteBufferSize = 8
  host uint8 ReadBufferSize = 8
  uint8 writeBuffer[WriteBufferSize]      // Write data buffer
  uint8 readBuffer[ReadBufferSize]        // Read data buffer
  uint8 writeDataCount                  // Number of bytes to write 
  uint8 readDataCount                   // Number of bytes to read 
  uint8 bytesWritten                    // Number of bytes written 
  uint8 bytesRead                       // Number of bytes read 
  uint8 tStatus                         // Status of transaction 
  uint8 tResult                         // Result of transaction 


  host TwiMasterMeta() { 
    // Host initializer
  }

  TwiMasterMeta() { 
    // Target initializer
  }

  //
  // Set the TWI bus speed at host time.
  // Supported speeds are 10kHz, 100kHz, 400kHz, 1MHz
  //
  public host setTwiSpeedOnHost(uint8 speed) {
    uint32 twiFreq = 0

    if   (speed == TwiSpeed.LOW)      { twiFreq = 10000 }
    elif (speed == TwiSpeed.STANDARD) { twiFreq = 100000 }
    elif (speed == TwiSpeed.FAST)     { twiFreq = 400000 }
    elif (speed == TwiSpeed.FASTPLUS) { twiFreq = 1000000 } 
    else {
      print "Unsupported interface speed: " + speed + "\n"
      print "Supported speeds are: 0 = 10kHz, 1 = 100kHz, 2 = 400kHz, 3 = 1MHz\n" 
      //return
    }

    speedRegValue = (Cpu.getFrequencyOnHost() / (2 * twiFreq)) - 5
    print "TWI Master set bus speed to " + twiFreq + "Hz\n"
  }

  //
  // Enable the TWI module.
  // TWI module enable function.
  // Enables master read and write interrupts.
  // Remember to enable interrupts globally from the main application.
  //
  public enable() {
    +{ `twiInterface`.MASTER.CTRLA }+ = +{ TWI_MASTER_INTLVL_LO_gc | TWI_MASTER_RIEN_bm | TWI_MASTER_WIEN_bm | TWI_MASTER_ENABLE_bm }+
    +{ `twiInterface`.MASTER.BAUD }+ = speedRegValue
    +{ `twiInterface`.MASTER.STATUS }+ = +{ TWI_MASTER_BUSSTATE_IDLE_gc }+
  }

  //
  // Returns the TWI bus state.
  // Returns the TWI bus state (type defined in device headerfile), unknown(0), idle(1), owner(2) or busy(3).
  //
  public uint8 getState() {
    return +{ `twiInterface`.MASTER.STATUS & TWI_MASTER_BUSSTATE_gm }+
  }

  //
  // Returns true if transaction is ready.
  // This function returns a boolean whether the TWI Master is ready for a new transaction.
  //
  public bool isReady() {
    return (tStatus & TwiMasterStatus.READY) > 0
  }

  //
  // TWI write transaction.
  // This function is TWI Master wrapper for a write-only transaction.
  //
  // public bool write(uint8 address, uint8 writeData[], uint8 bytesToWrite) {
  //   return writeRead(address, writeData, bytesToWrite, 0)
  // }

  //
  // TWI read transaction.
  // This function is a TWI Maste wrapper for read-only transaction.
  //
  // public bool read(uint8 address, uint8_t bytesToRead) {
  //   return writeRead(address, 0, 0, bytesToRead)
  // }

  //
  // TWI write and/or read transaction.
  // This function is a TWI Master write and/or read transaction. The function can be used to 
  // both write and/or read bytes to/from the TWI Slave in one transaction.
  //
  // public bool writeAndRead(uint8_t address, uint8 writeData[], uint8 bytesToWrite, uint8 bytesToRead) {
  //   // Parameter sanity check. 
  //   if (bytesToWrite > WriteBufferSize) { return false }
  //   if (bytesToRead > ReadBufferSize)   { return false }

  //   // Initiate transaction if bus is ready. 
  //   if (tStatus == TwiMasterStatus.READY) {
  //     tStatus = TwiMasterStatus.BUSY
  //     tResult = TwiMasterResult.UNKNOWN
  //     slaveAddress = address << 1

  //     // Fill write data buffer. 
  //     for (uint8 bufferIndex = 0; bufferIndex < bytesToWrite; bufferIndex++) {
  //       writeData[bufferIndex] = writeData[bufferIndex]
  //     }

  //     writeDataCount = bytesToWrite
  //     readDataCount = bytesToRead
  //     bytesWritten = 0
  //     bytesRead = 0

  //     // If write command, send the START condition + Address + 'R/_W = 0'
  //     if (writeDataCount > 0) {
  //       +{`twiInterface`.MASTER.ADDR}+ = slaveAddress & ~0x01
  //     }

  //     // If read command, send the START condition + Address + 'R/_W = 1'
  //     else if (readDataCount > 0) {
  //       +{`twiInterface`.MASTER.ADDR }+ = slaveAddress | 0x01
  //     }
  //     return true
  //   } else {
  //     return false
  //   }
  // }

  public hiddenFoo(uint8 address) {
    if (tStatus == TwiMasterStatus.READY) {
      tStatus = TwiMasterStatus.BUSY
      tResult = TwiMasterResult.UNKNOWN
      //slaveAddress = address << 1
      slaveAddress = address

      // Fill the write data buffer
      writeBuffer[0] = 0x01     // select column 1
      writeBuffer[1] = 0xFF     // row 1 on

      writeBuffer[2] = 0x02     // select column 2
      writeBuffer[3] = 0xFF     // row 2 on

      writeBuffer[4] = 0x0c     // update column data

      writeDataCount = 5  // Set to num bytes to write
      readDataCount = 0
      bytesWritten = 0
      bytesRead = 0

      // If write command, send the START condition + Address + 'R/_W = 0'
      if (writeDataCount > 0) {
        +{`twiInterface`.MASTER.ADDR}+ = slaveAddress & ~0x01
      }
    }
  }

  //
  // Common TWI master interrupt service routine.
  // Check current status and calls the appropriate handler.
  //
  public interruptHandler() {
    uint8 currentStatus = +{ `twiInterface`.MASTER.STATUS }+

    // If arbitration lost or bus error. 
    if ((currentStatus & +{TWI_MASTER_ARBLOST_bm}+) || (currentStatus & +{ TWI_MASTER_BUSERR_bm }+)) {
      arbitrationLostBusErrorHandler()
    }

    // If master write interrupt.
    elif (currentStatus & +{ TWI_MASTER_WIF_bm }+) { writeHandler() }

    // If master read interrupt.
    elif (currentStatus & +{ TWI_MASTER_RIF_bm }+ ) { readHandler() }

    // If unexpected state.
    else { transactionFinished(TwiMasterResult.FAIL) }
  }

  //
  // Handles TWI responses to lost arbitration and bus error.
  //
  public arbitrationLostBusErrorHandler() {
    uint8 currentStatus = +{ `twiInterface`.MASTER.STATUS }+

    // If bus error. 
    if (currentStatus & +{ TWI_MASTER_BUSERR_bm }+) { tResult = TwiMasterResult.BUS_ERROR }

    // If arbitration lost. 
    else { tResult = TwiMasterResult.ARBITRATION_LOST }

    // Clear interrupt flag. 
    +{ `twiInterface`.MASTER.STATUS }+ = currentStatus | +{ TWI_MASTER_ARBLOST_bm }+

    tStatus = TwiMasterStatus.READY
  }

  //
  // Handles TWI transactions (master write) and responses to (N)ACK.
  //
  public writeHandler() {
    // Local variables used in if tests to avoid compiler warning. 
    uint8 bytesToWrite  = writeDataCount;
    uint8 bytesToRead   = readDataCount;

    // If NOT acknowledged (NACK) by slave cancel the transaction. 
    if (+{ `twiInterface`.MASTER.STATUS & TWI_MASTER_RXACK_bm }+) {
      +{ `twiInterface`.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc }+
      tResult = TwiMasterResult.NACK_RECEIVED
      tStatus = TwiMasterStatus.READY
    }

    // If more bytes to write, send data. 
    elif (bytesWritten < bytesToWrite) {
      +{ `twiInterface`.MASTER.DATA }+ = writeBuffer[bytesWritten]
      ++bytesWritten;
    }

    // If bytes to read, send repeated START condition + Address + 'R/_W = 1'
    elif (bytesRead < bytesToRead) {
      +{ `twiInterface`.MASTER.ADDR }+ = slaveAddress | 0x01
    }

    // If transaction finished, send STOP condition and set RESULT OK. 
    else {
      +{ `twiInterface`.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc }+
      transactionFinished(TwiMasterResult.OK)
    }

  }

  //
  // This is the master read interrupt handler that takes care of
  // reading bytes from the TWI slave.
  //
  public readHandler() {
    // Fetch data if bytes to be read. 
    if (bytesRead < ReadBufferSize) {
      readBuffer[bytesRead] = +{ `twiInterface`.MASTER.DATA }+
      bytesRead++
    }

    // If buffer overflow, issue STOP and BUFFER_OVERFLOW condition. 
    else {
      +{ `twiInterface`.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc }+
      transactionFinished(TwiMasterResult.BUFFER_OVERFLOW)
    }

    // Local variable used in if test to avoid compiler warning. 
    uint8 bytesToRead = readDataCount

    // If more bytes to read, issue ACK and start a byte read. 
    if (bytesRead < bytesToRead) {
      +{ `twiInterface`.MASTER.CTRLC = TWI_MASTER_CMD_RECVTRANS_gc }+
    }

    // If transaction finished, issue NACK and STOP condition. 
    else {
      +{ `twiInterface`.MASTER.CTRLC = TWI_MASTER_ACKACT_bm | TWI_MASTER_CMD_STOP_gc }+
      transactionFinished(TwiMasterResult.OK);
    }
  }

  //
  // Prepares module for new transaction.
  //
  public transactionFinished(uint8 result) {
    tResult = result
    tStatus = TwiMasterStatus.READY
  }



// TWI master interrupt service routine.
//  Interrupt service routine for the TWI master. Copy the needed vectors
//  into your code.
//    ISR(TWIC_TWIM_vect)
//    {
//      TWI_MasterInterruptHandler(&twiMaster);
//    }
  

}