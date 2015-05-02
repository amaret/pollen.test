from amaret.local import LocalMcu
from LocalMcu import A1
from pollen.hardware import MetaLed{false} as Led

#TEST executable test
#TEST exports with compositions
#TEST Also test exports with composition inheritance
#TEST Also test with instantiated meta type


module Blink2 {

  host Blink2() {
    Led.pin := A1
  }

  pollen.reset() {
    LocalMcu.reset()
    Led.off()
  }

  pollen.shutdown(uint8 id) {
    LocalMcu.shutdown()
  }
  
  pollen.run() {
    for (uint8 x = 0; x < 10; x++) {
      Led.toggle()
      for (uint16 i = 0; i < 100; i++) {
        LocalMcu.wait(1000)
      }
    }
  }
  
}
