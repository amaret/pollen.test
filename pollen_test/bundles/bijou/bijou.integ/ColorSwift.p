
import pollen.environment as Bijou

from bijou.parts import LedState
from pollen.time import Timer
from pollen.math import Math


module ColorSwift {

  host Timer t = new Timer(tick)
  host LedState led = new LedState(0)

  pollen.run() {
    t.start(15)
    Bijou.run()
  }  

  tick() {
    uint8 r = Math.map16(Math.rand16(), 0, 65535, 0, 255)
    uint8 g = Math.map16(Math.rand16(), 0, 65535, 0, 255)
    uint8 b = Math.map16(Math.rand16(), 0, 65535, 0, 255)
    led.setRGBA(r, g, b, 20).apply()
  }

}

