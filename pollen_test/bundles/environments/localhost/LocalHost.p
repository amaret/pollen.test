
from local.mcu import Mcu 
from local.mcu import TimerMilli
from local.mcu import GlobalInterrupts
from local.mcu import ConsolePrint

from Mcu import Pin0
from Mcu import Pin1
from Mcu import Pin2
from Mcu import Pin3 as ButtonPin

from local.parts import ColorLed

from pollen.parts import LedMeta{false} as Led0
from pollen.parts import LedMeta{false} as Led1
from pollen.parts import LedMeta{false} as Led2

from pollen.event import Newsroom
from pollen.time import TimerManager

import Lifecycle

composition LocalHost extends Mcu {

  preset LocalHost() {
    Newsroom.GI := GlobalInterrupts
    TimerManager.hwTimer := TimerMilli
    Led0.pin := Pin0
    Led1.pin := Pin1
    Led2.pin := Pin2

    pollen.printProtocol := ConsolePrint
  }

  export Newsroom.run

  export Mcu
  export TimerMilli
  export GlobalInterrupts
  export Newsroom  
  
  export Led0
  export Led1
  export Led2

  export ColorLed

  export ButtonPin
}