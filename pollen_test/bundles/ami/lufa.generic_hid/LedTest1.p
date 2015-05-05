import pollen.environment as Env 
import LedManager

module LedTest1 {
  
  pollen.run() {
    uint8 i
    uint8 dcount = 10

    while(true) {

      for(i = 0; i < LedManager.getNumLeds(); ++i) {
        LedManager.setLed(i, true)
        delay(dcount)
      }

      for(i = 0; i < LedManager.getNumLeds(); ++i) {
        LedManager.setLed(i, false)
        delay(dcount)
      }

      LedManager.allOn()
      delay(dcount)
      LedManager.allOff()
      delay(dcount)      
    }

  }


  delay(uint16 dt) {
    for(uint16 i = 0; i < dt; ++i) {
      Env.wait(1000)
    }
  }

}