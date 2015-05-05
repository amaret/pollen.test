import pollen.environment as Env
from Env import StatusLed

module Blink {
  
  pollen.reset() {
    Env.reset()
  }

  pollen.ready() {
    for (uint8 i = 0; i < 2; i++) {
      StatusLed.on()
      Env.wait(40000)
      Env.wait(40000)
      StatusLed.off()
      Env.wait(40000)
      Env.wait(40000)
    }
  }

  pollen.run() {
    while(true) {
      for (uint8 i = 0; i < 2; i++) {
        StatusLed.on()
        Env.wait(40000)
        Env.wait(40000)
        StatusLed.off()
        Env.wait(40000)
        Env.wait(40000)
      }
    }
  }

}