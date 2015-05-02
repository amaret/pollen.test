
import pollen.environment as Env
from pollen.parts import LedMeta{true} as Led 


module Blink_01 {

  host Blink_01() {
    Led.pin := Env.PB5
  }
  
  pollen.run() {
    while(true) {
      Led.toggle()
      Env.wait(10000)
    }
  }
}