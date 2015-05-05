
import pollen.environment as Bijou

from Bijou import PC0 as Red
from Bijou import PC1 as Green

from bijou.pwm import PwmManager
from bijou.pwm import PwmChannel


module PwmTest3 {

  host PwmChannel redPwm = new PwmChannel(Red.set, Red.clear)
  host PwmChannel greenPwm = new PwmChannel(Green.set, Green.clear)
  
  PwmTest3() {
    Red.makeOutput()    
    Green.makeOutput()
  }

  pollen.reset() {
    Bijou.reset()
  }  

  pollen.run() {
    
    //ColorLed.setRGBA(255, 255, 255, 255)

    redPwm.start(10)
    greenPwm.start(100)

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