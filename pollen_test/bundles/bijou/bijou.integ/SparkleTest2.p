import pollen.environment as Bijou
from bijou.parts import LedState 
from pollen.math import Math
from pollen.time import Timer

module SparkleTest2 {
  
  host Timer t = new Timer(tick)
  host LedState led = new LedState(0)

  uint8 count = 0
  uint8 br = 255

  tick() {
    uint8 v = Math.map8(Math.rand8(), 0, 255, 100, 255)
    uint8 d = Math.map8(Math.rand8(), 0, 255, 10, 80)

    if (count++ == 7) {
      color()
      count = 0
    } else {
      walk(v)
      led.setRGBA(v, v, v, 255).apply()
    }
    t.oneshot(d)
  }

  color() {
    uint8 r = Math.map8(Math.rand16(), 0, 65535, 0, 155) + 100
    uint8 g = Math.map8(Math.rand16(), 0, 65535, 0, 155) + 100
    uint8 b = Math.map8(Math.rand16(), 0, 65535, 0, 155) + 100
    led.setRGBA(r, g, b, 255).apply()
  }

  walk(uint8 val) {
    if (val > br) {
      while (++br < val) {
        led.setRGBA(br, br, br, 255).apply()
      }
    } elif (val < br) {
      while (--br > val) {
        led.setRGBA(br, br, br, 255).apply()
      }
    }
  }

  pollen.run() {
    t.oneshot(15)
    Bijou.run()
  }

}