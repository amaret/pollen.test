
from mcu import Mcu
from mcu import PinMeta{"PORTA", 1} as Pin

module Test_03 {
    
  pollen.reset() {
      Mcu.reset()
  }

  pollen.ready() {
    Pin.makeInput()
    if (Pin.isInput()) {
        +{ printf("Pin is input\n") }+
    }

    Pin.makeOutput()
    if (Pin.isOutput()) {
        +{ printf("Pin is output\n") }+
    }
  }

  pollen.run() {
    Pin.set()
    Pin.clear()

    for (i = 0; i < 15; i++) {
        Pin.toggle()
    }
  }

  pollen.shutdown() {
      Mcu.shutdown()
  }
}

