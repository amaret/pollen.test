from amaret.boards import LocalBoard
from LocalBoard import Mcu
import LocalLed as Led

#TEST executable test
#TEST exports with compositions
#TEST Also test exports with composition inheritance

module Blink3 {

  pollen.reset() {
    Mcu.reset()
    Led.off()
  }

  pollen.shutdown(uint8 id) {
    Mcu.shutdown()
  }
  
  pollen.run() {
    for (uint8 x = 0; x < 20; x++) {
      Led.toggle()
      for (uint16 i = 0; i < 1000; i++) {
        Mcu.wait(1000)
      }
    }
  }
  
}
