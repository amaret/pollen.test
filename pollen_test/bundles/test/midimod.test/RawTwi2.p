
module RawTwi2 {
  
  +{ #define F_CPU 2000000 }+
  +{ #include <avr/io.h> }+
  +{ #include <avr/interrupt.h> }+
  +{ #include <util/delay.h> }+

  const uint8 SlaveAddress = 0x60

  host uint8 BufferSize = 5
  byte buffer[BufferSize] = { 0x01, 0x03, 0x02, 0x03, 0x0C }
  uint8 bufferCount = 0
  uint8 bytesWritten = 0

  host uint32 CpuSpeed = 2000000
  host uint32 BaudRate = 10000

  enum TwimStatus { READY = 0, BUSY = 1 }

  enum TwimResult { UNKNOWN          = 0,
                    OK               = 1,
                    BUFFER_OVERFLOW  = 2,
                    ARBITRATION_LOST = 3,
                    BUS_ERROR        = 4,
                    NACK_RECEIVED    = 5,
                    FAIL             = 6 }

  uint8 tResult = 0
  uint8 tStatus = TwimStatus.READY

  pollen.run() {

    boardInit()

    +{ _delay_ms(100) }+

    byte data[5] = { 0x01, 0x03, 0x02, 0x03, 0x0C }
    
    if (twiMasterWrite(SlaveAddress, data, 5)) {
      while(tStatus != TwimStatus.READY) { blinkFast() }
    } else {
      blinkError()
    }

    

    while(true) {  
      blinkSlow()
    }

  }

  boardInit() {
    +{PORTB.DIRSET}+ = (1 << 3) // make led pin output
    ledOff()

    +{PORTC.DIRSET}+ = (1 << 3) // make led matrix shutdown pin output
    matrixEnable()

    twimInit()

    // Enable LO interrupt level, turn on interrupts
    +{ PMIC.CTRL |= PMIC_LOLVLEN_bm }+
    +{ sei() }+
  }


  bool twiMasterWrite(uint8 address, byte [] data, uint8 dataLength) {

    if (dataLength > BufferSize) { return false }

    if (tStatus == TwimStatus.READY) { 
      tStatus = TwimStatus.BUSY
      tResult = TwimResult.UNKNOWN

      // BUG IN COPYING DATA, DATA IS HARD CODED ABOVE FOR NOW
      //for (uint8 i = 0; i < dataLength; i++) {
      //  buffer[i] = data[i]
      //}

      bufferCount = dataLength
      bytesWritten = 0

      if (dataLength > 0) {
        address = address << 1

        // send the START condition + Address + 'R/_W = 0'      
        +{TWIC.MASTER.ADDR}+ = address & (~0x01)
      }

      return true
    } else {
      return false
    }
  }

  matrixDisable() {
    +{PORTC.OUTCLR}+ = (1 << 3)   // active low shutdown
  }

  matrixEnable() {
    +{PORTC.OUTSET}+ = (1 << 3)   // set line high to get out of shutdown
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

  blinkSlow() {
    while(true) {
      ledOn()
      +{ _delay_ms(300) }+
      ledOff()
      +{ _delay_ms(300) }+
    }
  }

  blinkFast() {
    while(true) {
      ledOn()
      +{ _delay_ms(50) }+
      ledOff()
      +{ _delay_ms(50) }+
    }
  }

  blinkFastSlow() {
    while(true) {
      ledOn()
      +{ _delay_ms(50) }+
      ledOff()
      +{ _delay_ms(50) }+
      ledOn()
      +{ _delay_ms(300) }+
      ledOff()
      +{ _delay_ms(300) }+
    }
  }

  blinkSlowFast() {
    while(true) {
      ledOn()
      +{ _delay_ms(300) }+
      ledOff()
      +{ _delay_ms(300) }+
      ledOn()
      +{ _delay_ms(50) }+
      ledOff()
      +{ _delay_ms(50) }+
    }
  }

  blinkError() {
    while(true) {
      ledOn()
      +{ _delay_ms(50) }+
      ledOff()
      +{ _delay_ms(50) }+
      ledOn()
      +{ _delay_ms(50) }+
      ledOff()
      +{ _delay_ms(50) }+
      ledOn()
      +{ _delay_ms(50) }+
      ledOff()
      +{ _delay_ms(50) }+
      ledOn()
      +{ _delay_ms(300) }+
      ledOff()
      +{ _delay_ms(300) }+
    }

  }

  twimInit() {
    uint8 reg = 0

    +{ #define TWI_BAUD(F_SYS, F_TWI) ((F_SYS / (2 * F_TWI)) - 5) }+
    reg = +{ TWI_BAUD(`CpuSpeed`, `BaudRate`); }+

    +{ TWIC.MASTER.CTRLA = TWI_MASTER_INTLVL_LO_gc | TWI_MASTER_WIEN_bm | TWI_MASTER_ENABLE_bm }+ 
    +{ TWIC.MASTER.BAUD }+ = reg
    +{ TWIC.MASTER.STATUS }+ = +{ TWI_MASTER_BUSSTATE_IDLE_gc }+
  }

  //
  // Low-level interrupt service routine
  //
  +{ ISR(TWIC_TWIM_vect) { `twimInterrupt`(); } }+

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
    
    // If unexpected state.
    else { 
      blinkError()
      twimTransactionFinished(TwimResult.FAIL) 
    }


  }


  twimArbitrationLostBusErrorHandler() {
    // Handles TWI responses to lost arbitration and bus error.
  }

  twimWriteHandler() {
    // If NOT acknowledged (NACK) by slave cancel the transaction.
    if (+{TWIC.MASTER.STATUS & TWI_MASTER_RXACK_bm}+) {
      +{TWIC.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc}+
      tResult = TwimResult.NACK_RECEIVED
      tStatus = TwimStatus.READY

      //blinkFast()
    }

    // If more bytes to write, send data. 
    elif (bytesWritten < bufferCount) {
      +{TWIC.MASTER.DATA}+ = buffer[bytesWritten]
      ++bytesWritten        
    }

    // If transaction finished, send STOP condition and set RESULT OK.
    else {
      +{TWIC.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc}+
      twimTransactionFinished(TwimResult.OK)
    }
  }

  twimTransactionFinished(uint8 result) {
    tResult = result
    tStatus = TwimStatus.READY
  }


}