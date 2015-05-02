package test29

# TEST From pollen-bundles/examples.
# TEST Imports Led which contains the protocol member
# TEST and binds INSIDE this module (Blink4).


import AvrPin
#import MspPin
import Led

module Blink4 {

  host Blink4() {
    Led.pin := AvrPin
  }
  
  pollen.run() {
  
    while(true) {
      Led.toggle()
      delay(500)
    }
  }
  
  !-- Helper method --!  
  delay(uint16 ms) {
    for (; ms > 0; --ms) {
      for (uint16 us = 1000; us > 0; --us) {
        for (uint8 i = 0; i < 5; i++) {
          +{ asm ("nop") }+                              
        }
      }
    }
  }
}
