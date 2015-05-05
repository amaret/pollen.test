
from mcu import Mcu
from Mcu import Pin1

module Test_04 {
    
  pollen.reset() {
      Mcu.reset()
  }

  pollen.ready() {
    Pin1.makeInput()
    if (Pin1.isInput()) {
        +{ printf("Pin1 is input\n") }+
    }

    Pin1.makeOutput()
    if (Pin1.isOutput()) {
        +{ printf("Pin1 is output\n") }+
    }
  }

  pollen.run() {
    Pin1.set()
    Pin1.clear()

    for (i = 0; i < 15; i++) {
        Pin1.toggle()
    }
  }

  pollen.shutdown() {
      Mcu.shutdown()
  }
}

