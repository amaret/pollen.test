import pollen.environment as Bijou

from Bijou import ColorLed
from pollen.time import Timer
from bijou.parts import Lookup

module Wave {

  host Timer fTimer = new Timer(tick)
  host Timer f1Timer = new Timer(tick1)
  host Timer f2Timer = new Timer(tick2)  
  host Timer f3Timer = new Timer(tick3)  

  host uint8 timerMs = 30
  int16 tickCounts[3] = { 255, 255, 255 }
  uint8 rgb[3] = {0, 0, 0}
  
  pollen.reset() { 
    Bijou.reset()
  }

  pollen.run() { 
    fTimer.start(timerMs, true)
    f1Timer.start(30, true)
    f2Timer.start(30, true)
    f3Timer.start(30, true)        
    Bijou.run()
  }

  tick() {
    ColorLed.setRGB(rgb[0], rgb[1], rgb[2])    
  }

  tick1() {
    int16 val = Lookup.gamma(tickCounts[0])
    tickCounts[0] -= 4

    if (tickCounts[0] <= 0) { 
      val = 0
      tickCounts[0] = 255
      // f1Timer.stop()
      // f2Timer.start(timerMs, true)    
    }

    // uint8 rgb[3] = {0}
    // ColorLed.getRGB(rgb)
    rgb[0] = val
//    ColorLed.setRGB(val, rgb[1], rgb[2])
  }

  tick2() {    
    int16 val = Lookup.gamma(tickCounts[1])
    tickCounts[1] -= 4

    if (tickCounts[1] <= 0) { 
      val = 0
      tickCounts[1] = 255
      // f2Timer.stop()
      // f3Timer.start(timerMs, true)      
    }

    // uint8 rgb[3] = {0}
    // ColorLed.getRGB(rgb)
    rgb[1] = val
//    ColorLed.setRGB(rgb[0], val, rgb[2])
  }

  tick3() {
    int16 val = Lookup.gamma(tickCounts[2])
    tickCounts[2] -= 4

    if (tickCounts[2] <= 0) { 
      val = 0
      tickCounts[2] = 255
      // f3Timer.stop()
      // f1Timer.start(timerMs, true) 
    }

    // uint8 rgb[3] = {0}
    // ColorLed.getRGB(rgb)
    rgb[2] = val
//    ColorLed.setRGB(rgb[0], rgb[1], val)
  }


}