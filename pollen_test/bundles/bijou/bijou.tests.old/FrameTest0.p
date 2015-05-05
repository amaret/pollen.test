import pollen.environment as Bijou

from Bijou import ColorLed
from pollen.time import Timer

from bijou.parts import Lookup

module FrameTest0 {
  
  host Timer fTimer = new Timer(frameTick)
  uint16 count = 0

  pollen.reset() { 
    Bijou.reset()
  }

  pollen.run() { 

    fTimer.start(5, true)
    Bijou.run()
  }


  frameTick() {
    uint8 val = Lookup.gamma(count)
    ColorLed.setRGB(val, val, val)

    count++
    if (count == Lookup.getCurveSize()) { count = 0 }

  }

}