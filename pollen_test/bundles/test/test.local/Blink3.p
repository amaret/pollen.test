from atmel.atmega import ATmega328 as Mcu
from pollen.parts import LedMega{true} as Led

module Blink3 {
  
  host Blink3() {
    Led.pin := Mcu.PB5
  }

  pollen.run() {
    while(true) {
      Led.toggle()
      Mcu.wait(100000)
    }
  }
}