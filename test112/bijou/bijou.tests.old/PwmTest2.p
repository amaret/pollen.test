
import pollen.environment as Bijou

from Bijou import PC2 as Red

from bijou.pwm import PwmManager
from bijou.pwm import PwmChannel


module PwmTest2 {

  host PwmChannel redPwm = new PwmChannel(Red.set, Red.clear)
  
  PwmTest2() {
    Red.makeOutput()    
  }

  pollen.reset() {
    Bijou.reset()
  }  

  pollen.run() {
    
    //ColorLed.setRGBA(255, 255, 255, 255)

    redPwm.start(10)

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