import pollen.environment as Env
from Env import PA0
from Env import PA1
from Env import PA2

from usb import USB
import USBEvents
import Descriptors

module Test_2 {
  
  Test_2() {

    PA0.set()
    PA1.set()
    PA2.set()

    PA0.makeOutput()
    PA1.makeOutput()
    PA2.makeOutput()
  }

  pollen.run() {

    +{
//      PORTE.DIRSET = (1<<0) | (1<<1);
//      PORTE.OUTSET = (1<<0);
//      PORTR.DIRSET = 1 << 1;
    }+

    USB.configureClock()
    USB.enableInterrupts()
    USB.init()

    // enable all interrupt levels
    +{ PMIC.CTRL = PMIC_LOLVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_HILVLEN_bm }+

    Env.GlobalInterrupts.enable()

    while(true) {
      PA0.toggle()

      for(uint8 i = 0; i < 200; ++i) {
        Env.wait(1000)
      }
    }
  }

}