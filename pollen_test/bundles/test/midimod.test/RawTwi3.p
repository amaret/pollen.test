
module RawTwi3 {
  
  +{ 

    #define TWIM_STATUS_READY 0
    #define TWIM_STATUS_BUSY  1

    #define TWIM_RESULT_NACK_RECEIVED  0
    #define TWIM_RESULT_OK  1

  

    void blinkError(void);
    void blinkSlow(void);
    void blinkFast(void);

    uint8_t tStatus = 0, tResult = 0;
    
    void twimTransactionFinished(uint8_t result) {
      tResult = result;
      tStatus = TWIM_STATUS_READY;
    }

    ISR(TWIC_TWIM_vect) {     
      uint8 currentStatus = TWIC.MASTER.STATUS

      if (currentStatus & +{TWI_MASTER_WIF_bm}+) { 
        twimWriteHandler();       
      }
      
      // If unexpected state.
      else { 
        blinkError()
      }
    } 

    void twimWriteHandler(void) {
      // If NOT acknowledged (NACK) by slave cancel the transaction.
      if (TWIC.MASTER.STATUS & TWI_MASTER_RXACK_bm) {
        TWIC.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc;
        tResult = TWIM_RESULT_NACK_RECEIVED;
        tStatus = TWIM_STATUS_READY;
      }

      // If more bytes to write, send data. 
      elif (bytesWritten < bufferCount) {
        TWIC.MASTER.DATA = buffer[bytesWritten]
        ++bytesWritten        
      }

      // If transaction finished, send STOP condition and set RESULT OK.
      else {
        TWIC.MASTER.CTRLC = TWI_MASTER_CMD_STOP_gc;
        twimTransactionFinished(TWIM_RESULT_OK);
      }
    }

    void ledOn(void) {
      PORTB.OUTCLR = (1 << 3);
    }

    void ledOff(void) {
      PORTB.OUTSET = (1 << 3);
    }

    void blinkError(void) {
      while(true) {
        ledOn();
        _delay_ms(50);
        ledOff();
        _delay_ms(50);
        ledOn();
        _delay_ms(50);
        ledOff();
        _delay_ms(50);
        ledOn();
        _delay_ms(50);
        ledOff();
        _delay_ms(50);
        ledOn();
        _delay_ms(300);
        ledOff();
        _delay_ms(300);
      }
    }

  }+


  pollen.run() {
    +{

    }+
  } 


}