
module RawTwi {
  
  +{ 
    #include <avr/io.h> 
    #include <avr/interrupt.h>
  }+

  const uint8 SlaveAddress = 0x60

  host uint8 writeBufferSize = 5
  uint8 writeBuffer[writeBufferSize] = {0x01, 0xFF, 0x02, 0xFF, 0x0C}
  uint8 writeBufferCount = 0

  host uint32 CpuSpeed = 2000000
  host uint32 BaudRate = 100000

  enum TwimStatus { READY = 0,
                      BUSY = 1 }

  enum TwimResult { UNKNOWN          = 0,
                            OK               = 1,
                            BUFFER_OVERFLOW  = 2,
                            ARBITRATION_LOST = 3,
                            BUS_ERROR        = 4,
                            NACK_RECEIVED    = 5,
                            FAIL             = 6 }

  uint8 tResult = 0
  uint8 tStatus = TwimStatus.READY
  uint8 bytesRead = 0
  uint8 bytesWritten = 0

  +{ ISR(TWIC_TWIM_vect) { `twimInterrupt`(); } }+

  pollen.run() {
    volatile uint32 i = 0

    +{PORTB.DIRSET}+ = (1 << 3) // make led pin output
    ledOff()

    //+{PORTC.DIRSET}+ = (1 << 0)
    //+{PORTC.DIRSET}+ = (1 << 1)
    +{PORTC.DIRSET}+ = (1 << 3) // make led matrix shutdown pin output
    matrixShutdownOff()

    twimInit()

    // // Enable LO interrupt level.
    +{PMIC.CTRL |= PMIC_LOLVLEN_bm}+
    +{sei()}+

     //TWI_MasterWriteRead(&twiMaster, SlaveAddress, &sendBuffer[BufPos], 1, 1);

    uint8 addr = (SlaveAddress << 1)
    uint8 j = 0
    uint8 delay = 5

    while(true) {

      for(i = 0; i < 10000; ) { i++ }               


      +{ TWIC.MASTER.ADDR }+ = (addr & ~0x01)
      for(i = 0; i < delay; ) { i++ }               

      +{TWIC.MASTER.DATA}+ = 0x01   // col 1
      for(i = 0; i < delay; ) { i++ }               
      +{TWIC.MASTER.DATA}+ = 0x03   // red 1, 3, 5, 7
      for(i = 0; i < delay; ) { i++ }               

      +{TWIC.MASTER.DATA}+ = 0x04   // col 4
      for(i = 0; i < delay; ) { i++ }               
      +{TWIC.MASTER.DATA}+ = 0x00  // red 2, 4, 6, 8
      for(i = 0; i < delay; ) { i++ }               
      +{TWIC.MASTER.DATA}+ = 0x0C

      for(i = 0; i < delay; ) { i++ }
      +{TWIC.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc}+ 

      ledToggle()

    //for(i = 0; i < 10000; ) { i++ }               


    // +{ TWIC.MASTER.ADDR }+ = (addr & ~0x01)
    // for(i = 0; i < delay; ) { i++ }               

    // +{TWIC.MASTER.DATA}+ = 0x01   // col 1
    // for(i = 0; i < delay; ) { i++ }               
    // +{TWIC.MASTER.DATA}+ = 0x00   // red 1, 3, 5, 7
    // for(i = 0; i < delay; ) { i++ }               

    // +{TWIC.MASTER.DATA}+ = 0x04   // col 4
    // for(i = 0; i < delay; ) { i++ }               
    // +{TWIC.MASTER.DATA}+ = 0x00  // red 2, 4, 6, 8
    // for(i = 0; i < delay; ) { i++ }               

    // +{TWIC.MASTER.DATA}+ = 0x0C 

    // for(i = 0; i < delay; ) { i++ }
    // +{TWIC.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc}+


    }
  }

  matrixShutdownOn() {
    +{PORTC.OUTCLR}+ = (1 << 3)
  }

  matrixShutdownOff() {
    +{PORTC.OUTSET}+ = (1 << 3)
  }

  ledOn() {
    +{PORTB.OUTCLR}+ = (1 << 3)
  }

  ledOff() {
   +{PORTB.OUTSET}+ = (1 << 3)
  }

  ledToggle() {
    +{PORTB.OUTTGL}+ = (1 << 3)
  }

  bool twiWrite(uint8 bytesToWrite) {
    uint8 theAddress = 0

    // Parameter sanity check.
    if (bytesToWrite > writeBufferSize) { return false }

    // Initiate transaction if bus is ready.
    if (tStatus == TwimStatus.READY) {

      tStatus = TwimStatus.BUSY
      tResult = TwimResult.UNKNOWN

      theAddress = SlaveAddress << 1

      writeBufferCount = bytesToWrite
      bytesWritten = 0

      // If write command, send the START condition + Address + 'R/_W = 0'
      if (writeBufferCount > 0) {
        +{ TWIC.MASTER.ADDR }+ = (theAddress & ~0x01)
      }

      return true;
    } else {
      return false;
    }

  }

  twimInit() {
    uint8 reg = 0

    +{ #define TWI_BAUD(F_SYS, F_TWI) ((F_SYS / (2 * F_TWI)) - 5) }+
    reg = +{ TWI_BAUD(`CpuSpeed`, `BaudRate`); }+

    +{ TWIC.MASTER.BAUD }+ = reg
    +{ TWIC.MASTER.CTRLA = TWI_MASTER_ENABLE_bm }+ //TWI_MASTER_INTLVL_LO_gc | TWI_MASTER_RIEN_bm | TWI_MASTER_WIEN_bm | TWI_MASTER_ENABLE_bm }+    
    +{ TWIC.MASTER.STATUS }+ = +{ TWI_MASTER_BUSSTATE_IDLE_gc }+
  }

  twimInterrupt() {
    uint8 currentStatus = +{TWIC.MASTER.STATUS}+

    // If arbitration lost or bus error. 
    if ((currentStatus & +{TWI_MASTER_ARBLOST_bm}+) || (currentStatus & +{TWI_MASTER_BUSERR_bm}+)) {
      twimArbitrationLostBusErrorHandler()
    }

    // If master write interrupt.
    elif (currentStatus & +{TWI_MASTER_WIF_bm}+) { 
      twimWriteHandler()       
    }

    // If master read interrupt. 
    elif (currentStatus & +{TWI_MASTER_RIF_bm}+) { twimReadHandler() }
    
    // If unexpected state.
    else { twimTransactionFinished(TwimResult.FAIL) }

//    if (tResult == TwimResult.NACK_RECEIVED) { ... }
  }


  twimArbitrationLostBusErrorHandler() {
    // Handles TWI responses to lost arbitration and bus error.
  }

  twimWriteHandler() {
    // // Local variables used in if tests to avoid compiler warning.
    uint8 bytesToWrite = 5      // writeBufferCount

    // If NOT acknowledged (NACK) by slave cancel the transaction.
    if (+{TWIC.MASTER.STATUS & TWI_MASTER_RXACK_bm}+) {
      +{TWIC.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc}+
      tResult = TwimResult.NACK_RECEIVED
      tStatus = TwimStatus.READY

    }

    // If more bytes to write, send data. 
    elif (bytesWritten < bytesToWrite) {
      +{TWIC.MASTER.DATA}+ = writeBuffer[bytesWritten]
      ++bytesWritten;      
    }

    // If bytes to read, send repeated START condition + Address + 'R/_W = 1'
    //elif (bytesRead < bytesToRead) {
    // +{TWIC.MASTER.ADDR}+ = SlaveAddress | 0x01
    //}

    // If transaction finished, send STOP condition and set RESULT OK.
    else {
      +{TWIC.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc}+
      twimTransactionFinished(TwimResult.OK)
    }
  }

  twimReadHandler() {
    // TWI master read interrupt handler.
    // This is the master read interrupt handler that takes care of reading bytes from the TWI slave.
  }

  twimTransactionFinished(uint8 result) {
    tResult = result
    tStatus = TwimStatus.READY
  }


}