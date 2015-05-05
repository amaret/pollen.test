
from ti.msp430 import MSP430F2274 as Mcu
from Mcu import P1_0
from Mcu import P1_1

module Test_01 {

  volatile uint16 counter = 0

  pollen.reset() {
    Mcu.reset()

    P1_0.set()
    P1_1.set()

    P1_0.makeOutput()
    P1_1.makeOutput()
  }

  pollen.run() {

    while(true) {
      P1_0.toggle()
      delay()
    }
  }

  delay() {

    for (uint16 i = 0; i < 500; i++) {
      Mcu.wait(1000);
    }
  }

}