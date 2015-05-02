package atmel.atmega8

#TEST instantiate some meta types using single
#TEST quotes for multi byte strings (gets warning).
#TEST Also assign a string to a byte (error)

# Interrupt Sources
import MetaInterrupt{'TIMER0_COMPA_vect', 'TIMSK0', 'OCIE0A', 'TIFR0', 'OCF0A'} as Timer0MatchA

module ATmega328 {       

  start() {
    Timer0MatchA.enable() 
  }
  pollen.run() {
     byte c = "x"
  }
}


