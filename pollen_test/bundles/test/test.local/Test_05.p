
from mcu import Mcu


from Mcu import Pin1


module Test_05 {
  
  pollen.reset() {
    Mcu.reset()
  }

  pollen.ready() {
    Pin1.clear()
    Pin1.makeOutput()
  }

  pollen.run() {
    for (i = 0; i < 10; i++) {
      Pin1.toggle();
      delay()
    }
  }

  delay() {
    for (i = 0; i < 10; i++) {
      Mcu.wait(50000);
    }
  }

  pollen.shutdown() {
    Mcu.shutdown()  
  }
}