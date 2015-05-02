import pollen.environment as Bijou

from Bijou import ColorLed
from pollen.time import Timer
from bijou.parts import Lookup

module Fade3 {

  host Timer f1Timer = new Timer(tick1)
  host Timer f2Timer = new Timer(tick2)  
  host Timer f3Timer = new Timer(tick3)  

  host uint8 timerMs = 10
  int16 tickCounts[3] = { 255, 255, 255 }
  
  pollen.reset() { 
    Bijou.reset()
  }

  pollen.run() { 
    f1Timer.start(timerMs, true)
    f2Timer.start(timerMs*2, true)
    f3Timer.start(timerMs*3, true)
    Bijou.run()
  }

  tick1() {
    int16 val = Lookup.sine(tickCounts[0])
    tickCounts[0] -= 4

    if (tickCounts[0] <= 0) { 
      val = 0
      tickCounts[0] = 255
    }

    uint8 rgb[3] = {0}
    ColorLed.getRGB(rgb)
    ColorLed.setRGB(val, rgb[1], rgb[2])
  }

  tick2() {    
    int16 val = Lookup.sine(tickCounts[1])
    tickCounts[1] -= 4

    if (tickCounts[1] <= 0) { 
      val = 0
      tickCounts[1] = 255
    }

    uint8 rgb[3] = {0}
    ColorLed.getRGB(rgb)
    ColorLed.setRGB(rgb[0], val, rgb[2])
  }

  tick3() {
    int16 val = Lookup.sine(tickCounts[2])
    tickCounts[2] -= 4

    if (tickCounts[2] <= 0) { 
      val = 0
      tickCounts[2] = 255
    }

    uint8 rgb[3] = {0}
    ColorLed.getRGB(rgb)
    ColorLed.setRGB(rgb[0], rgb[1], val)
  }


}