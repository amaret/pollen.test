#package basic

# TEST Similar to test 26 (BlinkAvr.p) but uses  
# TEST msp430g2452. Injects low level code.
# TEST NOTE missing msp430g2452.h means some constant refs commented out.

module BlinkMsp430 {

//  +{ #include <msp430g2452.h> }+

  pollen.run() {  
    #+{WDTCTL}+ = +{WDTPW}+ | +{WDTHOLD}+    # Stop watchdog timer
    #+{P1OUT}+ &= ~(1 << 0)                  # Clear the pin
    #+{P1DIR}+ |= (1 << 0)                   # Make pin output
    
    while (true) {
      #+{P1OUT}+ ^= (1 << 0)                 # toggle the pin
      delay(200)
    }
  }

  
  !-- Helper method --!
  delay(uint16 ms) {
    for (; ms > 0; --ms) {
      for (uint16 us = 1000; us > 0; --us) {
        +{ asm ("nop") }+                              
      }
    }
  }
  
}
