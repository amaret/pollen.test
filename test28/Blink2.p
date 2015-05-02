#package basic

# TEST From pollen-bundles/examples.
# TEST Uses 'as' to rename with Pin

#import AvrPin as Pin
import MspPin as Pin

module Blink2 {

  Blink2() {
    +{WDTCTL}+ = +{WDTPW}+ | +{WDTHOLD}+    # Stop watchdog timer
    Pin.clear()
    Pin.makeOutput()
  }
  
  pollen.run() {
    while (true) {
      Pin.toggle()
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
