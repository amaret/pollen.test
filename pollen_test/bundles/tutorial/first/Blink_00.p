import pollen.environment as Environment
from Environment import LedPin

module Blink {
  
  Blink() {
    LedPin.makeOutput()
    LedPin.clear()
  }

  pollen.run() {

    while(true) {
      LedPin.toggle()
      Environment.wait(50000)
    }
  }
}