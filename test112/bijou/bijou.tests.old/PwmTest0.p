from bijou.boards import BijouTest as Bijou
from Bijou import PC10 as Led
from Bijou import PC11 as Led1

from bijou.pwm import PwmManager

module PwmTest0 {
  
  PwmTest0() {
    Led.makeOutput()
    Led.clear()

    Led1.makeOutput()
    Led1.clear()
  }

  pollen.reset() {
    Bijou.reset()

    +{ CMU_HFRCOBandSet(cmuHFRCOBand_14MHz); }+   // set HF RC oscillator to 1MHz
  }  

  pollen.run() {
    
    PwmManager.start()    
    //Led.set()

    while (true) {

    }
  }

  delay() { 
    volatile uint16 i = 0
    for (i = 0; i < 1000; ++i) {
      Bijou.wait(750)
    }
  }


}