package local.mcu

from pollen.hardware import CpuProtocol

import Cpu
import GlobalInterrupts
import TimerMilli

import PinMeta{"Pin", 0} as Pin0
import PinMeta{"Pin", 1} as Pin1
import PinMeta{"Pin", 2} as Pin2
import PinMeta{"Pin", 3} as Pin3
import PinMeta{"Pin", 4} as Pin4
import PinMeta{"Pin", 5} as Pin5
import PinMeta{"Pin", 6} as Pin6
import PinMeta{"Pin", 7} as Pin7

composition Mcu implements CpuProtocol {

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

  !--------------------------
    Peripherals (virtualized)
   --------------------------!
   export TimerMilli

  !--------------------------
    GPIO Pins
   --------------------------!
  export Pin0
  export Pin1
  export Pin2
  export Pin3
  export Pin4
  export Pin5
  export Pin6
  export Pin7

}