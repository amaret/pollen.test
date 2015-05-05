package atmel.atmega

from pollen.hardware import CpuProtocol

import Cpu
import GlobalInterrupts

!-- General Purpose I/O Pins --!
import PinMeta{"B", 0} as PB0
import PinMeta{"B", 1} as PB1
import PinMeta{"B", 2} as PB2
import PinMeta{"B", 3} as PB3
import PinMeta{"B", 4} as PB4
import PinMeta{"B", 5} as PB5

import PinMeta{"D", 0} as PD0
import PinMeta{"D", 1} as PD1
import PinMeta{"D", 2} as PD2
import PinMeta{"D", 3} as PD3
import PinMeta{"D", 4} as PD4
import PinMeta{"D", 5} as PD5
import PinMeta{"D", 6} as PD6
import PinMeta{"D", 7} as PD7

import InterruptMeta{ "TIMER0_OVF_vect", "TIMSK0", "TOIE0", "TIFR0", "TOV0"} as Timer0OverflowInterrupt
import InterruptMeta{ "TIMER1_COMPA_vect", "TIMSK1", "OCIE1A", "TIFR1", "OCF1A"} as Timer1MatchAInterrupt

composition ATmega168 implements CpuProtocol {
  
  host ATmega168() {
    print "ERROR: OLD CODE HERE!\n";
    //Cpu.setFrequencyOnHost(16000000)
  }

  !---------------------
    Main device modules
   ---------------------! 
  export Cpu
  export Cpu.reset
  export Cpu.shutdown
  export Cpu.wait
  export Cpu.cycle
  export Cpu.getFrequency
  export Cpu.getFrequencyOnHost
  export Cpu.setFrequency
  export Cpu.setFrequencyOnHost

  export GlobalInterrupts

   !---------------------
    Interrupt Sources
   ---------------------! 
  export Timer0OverflowInterrupt
  export Timer1MatchAInterrupt



  !---------------------
    GPIO Pins
   ---------------------! 
  export PB0
  export PB1
  export PB2
  export PB3
  export PB4
  export PB5

  export PD0
  export PD1
  export PD2
  export PD3
  export PD4
  export PD5
  export PD6
  export PD7

}