
from atmel.atmega8 import MetaInterrupt{"TIMER0_COMPA_vect", 
                                        "TIMSK0", "OCIE0A", 
                                        "TIFR0", "OCF0A"} as Timer0MatchA

# TEST multiple parameter meta type instantiation

module Test0 {

  host Test0() {
    Timer0MatchA.setHandlerOnHost(isr)
  }

  pollen.run() {
    
  }

  isr() {
  
  }
}
