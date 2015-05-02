import pollen.environment as Env
from Env import PA0
from Env import PA1
from Env import PA2
from Env import PA3
from Env import PA4

from usb import USB
import USBEvents
import Descriptors

module Test_3 {
  
  Test_3() {

    PA0.set()
    PA1.set()
    PA2.set()
    PA3.set()
    PA4.set()

    PA0.makeOutput()
    PA1.makeOutput()
    PA2.makeOutput()
    PA3.makeOutput()
    PA4.makeOutput()
  }

  pollen.run() {

    USB.configureClock()
    USB.enableInterrupts()
    USB.init()

    // enable all interrupt levels
    +{ PMIC.CTRL = PMIC_LOLVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_HILVLEN_bm }+

    Env.GlobalInterrupts.enable()

    while(true) {
      //PA4.toggle()

      // for(uint8 i = 0; i < 200; ++i) {
      //   Env.wait(1000)
      //}
    }
  }

}