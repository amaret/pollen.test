!--
  Board environment for Bijou using the ZeroGecko starter kit
--!

from silabs.efm32 import EFM32ZG222 as Mcu
from Mcu import GlobalInterrupts
from Mcu import MillisecTimer1

from Mcu import PC10
from Mcu import PC11
from Mcu import PC9

from pollen.parts import LedMeta{false} as Led0
from pollen.parts import LedMeta{false} as Led1
from pollen.parts import LedMeta{false} as Led2

from pollen.event import Newsroom
from pollen.time import TimerManager

from bijou.parts import ColorLed
from bijou.parts import Button


composition BijouTest {
  
  preset BijouTest() {
    Mcu.setFrequencyOnHost(14000000)
    Led0.pin := PC10
    Led1.pin := PC11
    Led2.pin := PC9
    ColorLed.Red   := Led0
    ColorLed.Green := Led1
    ColorLed.Blue  := Led2

    Newsroom.GI := GlobalInterrupts
    TimerManager.hwTimer := MillisecTimer1

  }

  export Mcu
  export Mcu.reset
  export Mcu.wait
  export Newsroom.run

  export PC9
  export PC10
  export PC11

  export Led0
  export Led1
  export Led2

  export ColorLed
}