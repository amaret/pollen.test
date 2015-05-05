package silabs.efm32

from pollen.hardware import CpuProtocol
import Cpu

import GlobalInterrupts

import PinMeta{"D", 5} as PD5
import PinMeta{"D", 6} as PD6
import PinMeta{"D", 7} as PD7

composition EFM32TG840 implements CpuProtocol {

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
    GPIO Pins
   ---------------------! 
  export PD5
  export PD6
  export PD7

}