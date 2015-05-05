package atmel.atmega

from pollen.hardware import CpuProtocol

import Cpu
import GlobalInterrupts

!-- General Purpose I/O Pins --!
import PinMeta{"D", 0} as PD0
import PinMeta{"D", 1} as PD1
import PinMeta{"D", 2} as PD2
import PinMeta{"D", 3} as PD3
import PinMeta{"D", 4} as PD4
import PinMeta{"D", 5} as PD5
import PinMeta{"D", 6} as PD6
import PinMeta{"D", 7} as PD7

!-- Interrupt Sources --!
import InterruptMeta{ "TIMER0_OVF_vect", "TIMSK0", "TOIE0", "TIFR0", "TOV0"} as Timer0OverflowInterrupt

!-- Serial Peripherals --!
import Uart0 as Uart


composition ATmega88 implements CpuProtocol {
  
  host ATmega88() {
    print "ERROR: OLD CODE HERE!\n";
    //Cpu.setFrequencyOnHost(8000000)
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

  !---------------------
    Serial Peripherals 
   ---------------------!
  export Uart

  !---------------------
    GPIO Pins
   ---------------------! 
  export PD0
  export PD1
  export PD2
  export PD3
  export PD4
  export PD5
  export PD6
  export PD7  

}