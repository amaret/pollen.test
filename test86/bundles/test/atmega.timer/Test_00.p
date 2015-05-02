
from atmel.atmega import ATmega168 as Mcu
from Mcu import PB5
from Mcu import PB4
from pollen.hardware import HandlerP

module Test_00 {

  host uint16 ticksPerMs = 0
  uint16 counter = 0

  +{
    #include <avr/io.h>
    #include <avr/interrupt.h>

    ISR(TIMER1_COMPA_vect) { (`tick`)(); }
  }+

  host Test_00() {
    ticksPerMs =  Mcu.getFrequencyOnHost() / (256.0 * 1000.0)
    print "Ticks Per MS: "
  }

  pollen.run() {

    PB4.clear()
    PB5.clear()
    PB4.makeOutput()
    PB5.makeOutput()

  # (CL_1)
  +{ TCCR1B = (1<<CS11)|(1<<CS10) }+ # Timer Clock = system clock / 64

  # (CL_2.0)
  +{ TIFR   = 1<<ICF1 }+   // Clear ICF1 / Clear pending interrupts

  // (CL_2.1)
  +{ TIMSK  = 1<<TICIE1 }+           // Enable Timer 1 Capture Event Interrupt



    # timer setup sequence
    #+{ TCCR1A }+ = 0x00
    #+{ TCCR1B }+ = 0x00            # CTC mode, Timer off    

    +{ OCR1AH }+ = (ticksPerMs >> 8)    # Set high byte of counter value
    +{ OCR1AL }+ = (ticksPerMs)         # Set low byte of counter value

    # start the timer sequence
    +{ TCNT1 }+ = 0                      # set timer counter = 0
    +{ TIFR1  &= ~(1 << OCF1A)  }+       # clear the interrupt flag
    +{ TIMSK1 |=  (1 << OCIE1A) }+       # enable timer interrupts
    +{ TCCR1B = 0x08 | 0x04 }+           # TIMER1_MODE_CTC | TIMER1_DIV256, setup pre-scale value & start the timer 

    while (true) {

    }

  }

  tick() {
    PB5.toggle()
    PB4.toggle()
    +{ TCNT1 }+ = 0 # reset Timer Count Register

  }

}