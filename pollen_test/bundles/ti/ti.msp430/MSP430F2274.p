
from pollen.hardware import CpuProtocol

import Cpu 

import PinMeta{"P1", 0} as P1_0
import PinMeta{"P1", 1} as P1_1
import PinMeta{"P1", 2} as P1_2
import PinMeta{"P1", 3} as P1_3
import PinMeta{"P1", 4} as P1_4
import PinMeta{"P1", 5} as P1_5
import PinMeta{"P1", 6} as P1_6
import PinMeta{"P1", 7} as P1_7

import PinMeta{"P2", 0} as P2_0
import PinMeta{"P2", 1} as P2_1
// import PinMeta{"P2", 2} as P2_2
// import PinMeta{"P2", 3} as P2_3
// import PinMeta{"P2", 4} as P2_4
// import PinMeta{"P2", 5} as P2_5
// import PinMeta{"P2", 6} as P2_6
// import PinMeta{"P2", 7} as P2_7

// import PinMeta{"P3", 0} as P3_0
// import PinMeta{"P3", 1} as P3_1
// import PinMeta{"P3", 2} as P3_2
// import PinMeta{"P3", 3} as P3_3
// import PinMeta{"P3", 4} as P3_4
// import PinMeta{"P3", 5} as P3_5
// import PinMeta{"P3", 6} as P3_6
// import PinMeta{"P3", 7} as P3_7

// import PinMeta{"P4", 0} as P4_0
// import PinMeta{"P4", 1} as P4_1
// import PinMeta{"P4", 2} as P4_2
// import PinMeta{"P4", 3} as P4_3
// import PinMeta{"P4", 4} as P4_4
// import PinMeta{"P4", 5} as P4_5
// import PinMeta{"P4", 6} as P4_6
// import PinMeta{"P4", 7} as P4_7


composition MSP430F2274 implements CpuProtocol {
  
  export Cpu
  export Cpu.reset
  export Cpu.shutdown
  export Cpu.wait
  export Cpu.cycle
  export Cpu.getFrequency
  export Cpu.getFrequencyOnHost
  export Cpu.setFrequency
  export Cpu.setFrequencyOnHost

  export P1_0
  export P1_1
  export P1_2
  export P1_3
  export P1_4
  export P1_5
  export P1_6
  export P1_7

  export P2_0
  export P2_1


}
