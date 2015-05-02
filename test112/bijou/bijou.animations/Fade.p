import pollen.environment as Bijou

from Bijou import ColorLed
from pollen.time import Timer
from bijou.parts import Lookup

module Fade {

  host Timer fTimer = new Timer(tick)
  host uint8 timerMs = 2
  int16 tickCount = 255
  
  pollen.reset() { 
    Bijou.reset()
  }

  pollen.run() { 
    fTimer.start(timerMs, true)
    Bijou.run()
  }

  tick() {
    int16 val = Lookup.sine(tickCount)
    tickCount -= 4

    if (tickCount <= 0) { 
      val = 0
      tickCount = 255
    }

    ColorLed.setRGB(val, val, val)
  }


}