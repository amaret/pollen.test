
from pollen.hardware import Mcu as McuProtocol

import Mcu
import MetaPin{"A", 1} as A1

composition LocalMcu implements McuProtocol {

  !---------------------
    Main device modules
   ---------------------! 
  export Mcu
  export Mcu.reset
  export Mcu.shutdown
  export Mcu.wait
  export Mcu.cycle
  export Mcu.getFrequency
  export Mcu.getFrequencyOnHost
  export Mcu.setFrequency
  export Mcu.setFrequencyOnHost


  !--------------------------
    Peripherals (virtualized)
   --------------------------!
   export A1

}
