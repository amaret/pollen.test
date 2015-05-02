
# TEST protocol member binding in preset initializer
# TEST errmsg: protocol member binding in host fcn AFTER
# TEST binding in preset initializer.
# TEST Runnable test.

from BlinkEnvComp import Led
from BlinkEnvComp import AvrPin

module Blink {

+{ #include <stdlib.h> }+

  Blink() {
    Led.off()
  }
  host Blink() {
    Led.pin := AvrPin
  }
  
  pollen.run() {    
    uint8 i = 0
    while (i++ < 5) {
      Led.toggle()
      delay(500)
    }
    +{ exit(0) }+
  }


  !-- Helper method --!
  delay(uint16 ms) {
    for (; ms > 0; --ms) {
      for (uint16 us = 1000; us > 0; --us) {
        for (uint8 i = 0; i < 5; i++) {
          //+{ asm ("nop") }+                              
        }
      }
    }
  }

}
