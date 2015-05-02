#package basic

# TEST From pollen-bundles/examples.
# TEST Use composition BlinkEnv to bind 
# TEST protocol member OUTSIDE of module.

from BlinkEnv import Led
#import BlinkEnv

module Blink5 {

  Blink5() {
    Led.off()
  }
  
  pollen.run() {    
    while (true) {
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
