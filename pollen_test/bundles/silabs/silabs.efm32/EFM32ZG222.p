package silabs.efm32

from pollen.hardware import CpuProtocol
import Cpu

import GlobalInterrupts

import MicrosecTimer0
import MillisecTimer1

import PinMeta{"C", 0} as PC0
import PinMeta{"C", 1} as PC1

import PinMeta{"C", 8} as PC8
import PinMeta{"C", 9} as PC9
import PinMeta{"C", 10} as PC10
import PinMeta{"C", 11} as PC11


composition EFM32ZG222 implements CpuProtocol {

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
    Timer Drivers
   ---------------------! 
  export MicrosecTimer0
  export MillisecTimer1



  !---------------------
    GPIO Pins
   ---------------------! 
  export PC0
  export PC1

  export PC8
  export PC9
  export PC10
  export PC11

}