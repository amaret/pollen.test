
package silabs.efm32

from pollen.hardware import CpuProtocol
import Cpu

import GlobalInterrupts

import MicrosecTimer0
import MillisecTimer1

import PinMeta{"C", 0} as PC0
import PinMeta{"C", 1} as PC1
import PinMeta{"C", 2} as PC2
import PinMeta{"C", 3} as PC3

import PinMeta{"B", 9} as PB9
import PinMeta{"B", 10} as PB10


composition EFM32G890 implements CpuProtocol {

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
  export PC2
  export PC3

  export PB9
  export PB10

}