#package basic

# TEST From pollen-bundles/examples.
# TEST Uses protocol member internally w/ Pin

import Pin

import AvrPin
#import MspPin

module Blink3 {

  Pin pin

  host Blink3() {
    pin := AvrPin    # MspPin
  }

  Blink3() {
    pin.clear()
    pin.makeOutput()
  }
  
  pollen.run() {
    while (true) {
      pin.toggle()
      delay(1500)
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
