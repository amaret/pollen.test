from bijou.boards import BijouTest as Bijou
from Bijou import PC10 as Led
from Bijou import PC11 as Led1

from bijou.pwm import PwmManager
from bijou.pwm import PwmChannel

module PwmTest1 {
  
  host PwmChannel pwm0 = new PwmChannel(Led.set, Led.clear)
  host PwmChannel pwm1 = new PwmChannel(Led1.set, Led1.clear)

  PwmTest1() {
    Led.makeOutput()
    Led.clear()

    Led1.makeOutput()
    Led1.clear()
  }

  pollen.reset() {
    Bijou.reset()
  }  

  pollen.run() {
    volatile int16 i = 0

    pwm0.start(0)
    pwm1.start(0)

    while (true) {
      for (i = 0; i < 255; i++) {
        pwm0.setDuty(i)
        pwm1.setDuty(255-i)
        delay()
      }

      for (i = 255; i >= 0; i--) {
        pwm0.setDuty(i)
        pwm1.setDuty(255-i)
        delay()
      }
    }
  }

  delay() { 
    volatile uint16 i = 0
    for (i = 0; i < 10; ++i) {
      Bijou.wait(100)
    }
  }


}