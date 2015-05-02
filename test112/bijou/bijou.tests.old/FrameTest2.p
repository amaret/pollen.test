import pollen.environment as Bijou

from Bijou import ColorLed
from Bijou import Button
from pollen.time import Timer
from bijou.parts import Lookup

module FrameTest2 {
  
  host Timer sparkleTimer = new Timer(sparkleTick)
  host Timer bigTimer = new Timer(bigTick)
  int16 tickCount = 255

  host FrameTest2() {
    Button.setClickHandlerOnHost(buttonClick)
  }

  pollen.reset() { 
    Bijou.reset()
  }

  pollen.run() { 

    bigTimer.start(2000, true)
    Bijou.run()
  }

  buttonClick() {
  }


  sparkleTick() {
     int16 val = Lookup.gamma(tickCount)
     tickCount -= 4
     if (tickCount <= 0) { 
       sparkleTimer.stop()
       val = 0
     }
     ColorLed.setRGB(val, val, val)
  }


  bigTick() {

    tickCount = 255
    sparkleTimer.start(2, true)

  }

}