import pollen.environment as Bijou

from Bijou import ColorLed
from pollen.time import Timer
from bijou.parts import Pixel

module Test1 {

  host Timer t1 = new Timer(tick)
  host Pixel pixel = new Pixel(0, 0, 0, 0)
  uint8 count = 0
  bool dirUp = true

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    t1.start(5, true)
    Bijou.run()
  }

  tick() {
    if (dirUp) {
      count++
      if (count == 255) { dirUp = false }
    } else {
      count--
      if (count == 0) { dirUp = true }
    }
    pixel.setRGB(count, count, count)
    ColorLed.setPixel(pixel)
  }  
}