
import pollen.environment as Bijou

from Bijou import ColorLed
from pollen.time import Timer
from bijou.parts import Lookup

module SparkleFast {

  host Timer sparkleTimer = new Timer(sparkleTick)
  host uint8 timerMs = 2
  int16 tickCount = 255

  +{ #include <stdlib.h> }+
  
  pollen.reset() { 
    Bijou.reset()
  }

  pollen.run() { 
    sparkleTimer.start(timerMs, true)
    Bijou.run()
  }

  sparkleTick() {
    int16 val = Lookup.gamma(tickCount)
    tickCount -= 4

    if (tickCount <= 0) { 
      val = 0
      tickCount = 255
    }

    ColorLed.setRGB(val, val, val)
  }


}