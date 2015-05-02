
from amaret.local import Mcu
from amaret.local import MetaPin{"A", 1} as A1

# TEST runnable output using gcc
# TEST Pin implmented with meta type


module Blink1 {

  pollen.reset() {
    Mcu.reset()
    A1.clear()
    A1.makeOutput()
  }

  pollen.run() {
    for (uint8 x = 0; x < 20; x++) {
      A1.toggle()
      for (uint16 i = 0; i < 1000; i++) {
        Mcu.wait(1000)
      }
    }
  }
  
  pollen.shutdown(uint8 id) {  
    Mcu.shutdown()
  }
}
