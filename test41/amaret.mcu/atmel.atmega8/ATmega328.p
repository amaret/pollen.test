!-----------------------------------------------------------------------------
  Mcu Composition for the ATmega328 Microcontroller
------------------------------------------------------------------------------!

package atmel.atmega8

from pollen.hardware import Mcu as McuProtocol

import Core

--- Create module instances for each digital i/o pin ---
# Port B
import MetaPin{"PORTB", "DDRB", 0} as PB0
import MetaPin{"PORTB", "DDRB", 1} as PB1
import MetaPin{"PORTB", "DDRB", 2} as PB2
import MetaPin{"PORTB", "DDRB", 3} as PB3
import MetaPin{"PORTB", "DDRB", 4} as PB4
import MetaPin{"PORTB", "DDRB", 5} as PB5
import MetaPin{"PORTB", "DDRB", 6} as PB6
import MetaPin{"PORTB", "DDRB", 7} as PB7

# Port C
import MetaPin{"PORTC", "DDRC", 0} as PC0
import MetaPin{"PORTC", "DDRC", 1} as PC1
import MetaPin{"PORTC", "DDRC", 2} as PC2
import MetaPin{"PORTC", "DDRC", 3} as PC3
import MetaPin{"PORTC", "DDRC", 4} as PC4
import MetaPin{"PORTC", "DDRC", 5} as PC5
import MetaPin{"PORTC", "DDRC", 6} as PC6

# Port D
import MetaPin{"PORTD", "DDRD", 0} as PD0
import MetaPin{"PORTD", "DDRD", 1} as PD1
import MetaPin{"PORTD", "DDRD", 2} as PD2
import MetaPin{"PORTD", "DDRD", 3} as PD3
import MetaPin{"PORTD", "DDRD", 4} as PD4
import MetaPin{"PORTD", "DDRD", 5} as PD5
import MetaPin{"PORTD", "DDRD", 6} as PD6
import MetaPin{"PORTD", "DDRD", 7} as PD7

# Interrupt Sources
#import MetaInterrupt{"TIMER0_COMPA_vect", "TIMSK0", "OCIE0A", "TIFR0", "OCF0A"} as Timer0MatchA


composition ATmega328 implements McuProtocol {       

  !----------------------------------------------------------------------------
    Main device modules
   ----------------------------------------------------------------------------!
  export Core
  export Core.reset
  export Core.shutdown
  export Core.wait
  export Core.cycle
  export Core.getFrequency
  #export Core.getFrequencyOnHost
  export Core.setFrequency
  #export Core.setFrequencyOnHost

  !----------------------------------------------------------------------------
    General Purpose I/O Pins
   ----------------------------------------------------------------------------!

  # Port B
  export PB0
  export PB1
  export PB2
  export PB3
  export PB4
  export PB5
  export PB6
  export PB7

  # Port C
  export PC0
  export PC1
  export PC2
  export PC3
  export PC4
  export PC5
  export PC6
  
  # Port D
  export PD0
  export PD1
  export PD2
  export PD3
  export PD4
  export PD5
  export PD6
  export PD7

}


