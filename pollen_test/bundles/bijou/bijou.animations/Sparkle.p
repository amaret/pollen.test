import pollen.environment as Bijou

from Bijou import ColorLed
from pollen.time import Timer
from bijou.parts import Lookup

module Sparkle {

  host Timer sparkleTimer = new Timer(sparkleTick)
  host Timer bigTimer = new Timer(bigTick)
  host uint32 seed = 262626
  host uint16 randDivisor = 1300

  int16 tickCount = 255

  +{ #include <stdlib.h> }+
  
  pollen.reset() { 
    Bijou.reset()
  }

  pollen.run() { 
    uint16 val = +{ rand() % `randDivisor` }+

    bigTimer.oneshot(val)
    Bijou.run()
  }


  bigTick() {
    tickCount = 255
    sparkleTimer.start(2, true)
  }


  sparkleTick() {
    int16 val = Lookup.gamma(tickCount)
    tickCount -= 4
    if (tickCount <= 0) { 
      sparkleTimer.stop()
      val = 0       
      uint16 dt = +{ rand() % `randDivisor` }+
      bigTimer.oneshot(dt)   // one shot the big timer with a random number! 
    }
    ColorLed.setRGB(val, val, val)
  }




}