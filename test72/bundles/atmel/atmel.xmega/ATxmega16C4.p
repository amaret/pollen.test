from pollen.hardware import CpuProtocol

import Cpu
import GlobalInterrupts

import PinMeta{"PORTA", 0} as PA0
import PinMeta{"PORTA", 1} as PA1
import PinMeta{"PORTA", 2} as PA2
import PinMeta{"PORTA", 3} as PA3
import PinMeta{"PORTA", 4} as PA4
import PinMeta{"PORTA", 5} as PA5
import PinMeta{"PORTA", 6} as PA6
import PinMeta{"PORTA", 7} as PA7

// Define the rest of the Pins...

//import InterruptMeta{"TCC0_OVF", "TCC0", "INTCTRLA", "TC_OVFINTLVL_MED_gc", 
//                     "INTFLAGS", "TC0_OVFIF_bm"} as Timer0_OverflowInterrupt


import WatchdogTimer

composition ATxmega16C4 implements CpuProtocol {
  
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
  export WatchdogTimer

  !---------------------
    Interrupt Sources
   ---------------------! 
//  export Timer0_OverflowInterrupt


  !---------------------
    GPIO Pins
   ---------------------! 
  export PA0
  export PA1
  export PA2
  export PA3
  export PA4
  export PA5
  export PA6
  export PA7            
}