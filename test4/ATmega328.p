from pollen.hardware import McuCore

import Core

composition ATmega328 implements McuCore {       

  !----------------------------------------------------------------------------
    Main device modules
   ----------------------------------------------------------------------------!
  export Core.reset
  export Core.shutdown
  export Core.wait
  export Core.cycle
  export Core.getFrequency
  export Core.getFrequencyOnHost
  export Core.setFrequency
  export Core.setFrequencyOnHost
  export Core

}


