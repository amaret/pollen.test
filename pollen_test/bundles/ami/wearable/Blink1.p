import pollen.environment as Env
from Env import Led0

module Blink1 {
  
  Blink1() {
    // PA0.clear()
    // PA0.makeOutput()
  }

  pollen.run() {
    while(true) {
      Led0.toggle()
      Env.cycle()
      //delay(100)
    }
  }

  delay(uint16 dt) {
    for(uint16 i = 0; i < dt; i++) {
      Env.wait(1000)
    }
  }

}