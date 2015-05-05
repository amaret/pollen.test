import pollen.environment as Bijou

from bijou.parts import LedState
from bijou.pattern import Lookup
from pollen.time import Timer
from pollen.math import Math
from pollen.event import Event

module RandTest {
  
  host Timer t = new Timer(flicker)
  host LedState led = new LedState(0)
  host Event walk = new Event(walkTo)
  uint8 count = 0
  uint8 countMax = 3

  uint8 walkVal = 0
  uint8 curVal = 0

  flicker() {

    if (count++ == countMax) {
      colorSet()
      count = 0
    } else {
      walkVal = Math.map16(Math.rand16f(), 0, 65535, 120, 255)
      walk.post()
    }

    //led.setRGBA(255, 255, 255, walkVal).apply()
  }

  walkTo() {
    if (walkVal > curVal) {
      while (curVal <= walkVal) {
        led.setRGBA(255, 255, 255, curVal++).apply()
      }
    } else {
      while (curVal >= walkVal) {
        led.setRGBA(255, 255, 255, curVal--).apply()
      }
    }
  }

  colorSet() {
    uint8 r = Math.map16(Math.rand16(), 0, 65535, 50, 255)
    uint8 g = Math.map16(Math.rand16(), 0, 65535, 50, 255)
    uint8 b = Math.map16(Math.rand16(), 0, 65535, 50, 255)

    uint8 rp = led.getRed()
    uint8 gp = led.getGreen()
    uint8 bp = led.getBlue()

    while (rp != r && gp != g && bp != b) {

      if ( r > rp ) { rp++ }
      elif (r < rp) { rp-- }

      if ( g > gp ) { gp++ }
      elif (g < gp) { gp-- }

      if ( b > bp ) { bp++ }
      elif (b < bp) { bp-- }

      led.setRGBA(r, g, b, 255).apply()
    }

    //led.setRGBA(r, g, b, 255).apply()
  }

  pollen.reset() {
    Bijou.reset()    
  }

  pollen.run() {
    t.start(25)
    Bijou.run()
  }

}