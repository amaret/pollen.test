import pollen.environment as Env
from Env import GlobalInterrupts
from Env import ExpansionTwiMaster as MatrixTwi
from Env import StatusLed
from Env import D2 as MatrixShutdown
//from Env import ExpansionTwiMasterWriteInterrupt as TwiWriteInt

//from Env import Mcu 
//from Mcu import TwiMasterWriteInterruptPortE as TwiWriteInterrupt

module LightOne {
  
  const uint8 MatrixAddress = 0x60    // 1100000 0x60 Read, 0x61 (write)(R/ -W)
  const uint8 MatrixConfigReg = 0x00   // Default: Normal operation, no audio, 8x8 matrix mode
  const uint8 MatrixUpdateReg = 0x0C
  const uint8 cols[11] = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B }

  +{
    ISR(TWIC_TWIM_vect) { 
      `MatrixTwi.interruptHandler`();
      `StatusLed.on`();
    }
  }+

  host LightOne() {
    MatrixTwi.setTwiSpeedOnHost(0x01)   // enums are broken, should be TwiSpeed.STANDARD (100kHz)
    //MatrixTwi.setTwiSpeedOnHost(0x02)   // enums are broken, should be TwiSpeed.FAST (400kHz)

    //TwiWriteInt.setHandlerOnHost(MatrixTwi.interruptHandler)
  }

  LightOne() {
    MatrixShutdown.clear()
    MatrixShutdown.makeOutput()
  }


  pollen.run() {

    MatrixShutdown.set()    // take driver out of shutdown
    MatrixTwi.enable()      // this enables the interrupts
    
    // enable all interrupt levels
    +{ PMIC.CTRL = PMIC_LOLVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_HILVLEN_bm; }+
    GlobalInterrupts.enable()

    // do the hidden foo
    MatrixTwi.hiddenFoo(MatrixAddress)

    while(true) {
      StatusLed.on()
      //MatrixTwi.hiddenFoo(MatrixAddress)
      // send 
      // TWI_MasterWriteRead(&twiMaster,
      //                   SLAVE_ADDRESS,
      //                   &sendBuffer[BufPos],
      //                   1,
      //                   1);

      //while (twiMaster.status != TWIM_STATUS_READY) {
      ///* Wait until transaction is complete. */
      //}

    }

  }

  pollen.reset() {
    Env.reset()     // important to reset the environment! 
  }


}