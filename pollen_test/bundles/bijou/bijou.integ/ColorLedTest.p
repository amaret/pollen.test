import pollen.environment as Bijou

from Bijou import ColorLed
from pollen.time import Timer

module ColorLedTest {
  
  host Timer t = new Timer(toggle)

  uint8 vals[6] = {255, 200, 150, 100, 50, 0}
  uint8 val = 0

  toggle() {
    uint8 v = vals[val++]    
    ColorLed.setRGB(v, v, v)
    if (val > 5) {
      val = 0
    }
  }

  pollen.reset() {
    Bijou.reset()    
  }

  pollen.run() {
    t.start(250)
    Bijou.run()
  }

}