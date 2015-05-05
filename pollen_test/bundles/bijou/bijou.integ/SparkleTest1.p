import pollen.environment as Bijou
from bijou.parts import LedState 
from pollen.math import Math
from pollen.time import Timer

module SparkleTest1 {
  
  host Timer t = new Timer(tick)
  host LedState led = new LedState(0)

  uint16 count = 0
  uint8 brightness = 100

  tick() {
    uint8 r = Math.map16(Math.rand16(), 0, 65535, 0, 155) + 100
    uint8 g = Math.map16(Math.rand16(), 0, 65535, 0, 155) + 100
    uint8 b = Math.map16(Math.rand16(), 0, 65535, 0, 155) + 100
    uint8 d = Math.map8(Math.rand8(), 0, 255, 1, 40)

    // if (count++ == 500) {
    //   brightness = 255
    //   count = 0
    // } else {
    //   brightness = 100
    // }

    led.setRGBA(r, g, b, 255).apply()
    t.oneshot(d)
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {

    t.oneshot(15)
    Bijou.run()
  }

}