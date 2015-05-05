from silabs.efm32 import EFM32ZG108 as Mcu

from Mcu import GlobalInterrupts
from Mcu import MillisecTimer1

from Mcu import PC0
from Mcu import PC1
from Mcu import PB7
from Mcu import PB8

from pollen.parts import LedMeta{true} as Led0
from pollen.parts import LedMeta{true} as Led1
from pollen.parts import LedMeta{true} as Led2

from pollen.event import Newsroom
from pollen.time import TimerManager

from bijou.parts import ColorLed
// from bijou.parts import Button

import Lifecycle

composition BijouOneLed {
  
  host BijouOneLed() {        // we should be able to use preset here!
    Mcu.setFrequencyOnHost(14000000)
    Led0.pin := PC0
    Led1.pin := PC1
    Led2.pin := PB7
    ColorLed.Red   := Led0
    ColorLed.Green := Led1
    ColorLed.Blue  := Led2

    // Button.pin := PB8

    Newsroom.GI := GlobalInterrupts
    TimerManager.hwTimer := MillisecTimer1
  }

  export Mcu
  export Mcu.reset
  export Mcu.wait
  export Newsroom.run

  export PC0
  export PC1
  export PB7

  export Led0
  export Led1
  export Led2

  export ColorLed
  // export Button
}

