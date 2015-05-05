package silabs.efm32

from pollen.hardware import CpuProtocol
import Cpu

import GlobalInterrupts
import GlobalInterrupts

import MicrosecTimer0
import MillisecTimer1


// Fill in the rest of the pins ...
import PinMeta{"C", 0} as PC0
import PinMeta{"C", 1} as PC1
// Fill in the rest of the pins ...
import PinMeta{"C", 14} as PC14
import PinMeta{"C", 15} as PC15
// Fill in the rest of the pins ...
import PinMeta{"B", 7} as PB7
import PinMeta{"B", 8} as PB8

composition EFM32ZG108 implements CpuProtocol {

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
    Timer Peripherals
   ---------------------! 
   export MicrosecTimer0
   export MillisecTimer1

  !---------------------
    GPIO Pins
   ---------------------! 
  export PC0
  export PC1
  export PC14
  export PC15

  export PB7
  export PB8


}