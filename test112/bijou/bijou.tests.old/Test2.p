import pollen.environment as Bijou

from bijou.parts import Projector
from pollen.time import Timer
from bijou.parts import Pixel

module Test2 {

  host Timer t1 = new Timer(tick)

  host Pixel on = new Pixel(255, 255, 255, 255)
  host Pixel off = new Pixel(0, 0, 0, 0)
  bool isOn = false

  Test2() {
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {

    t1.start(200, true)
    Projector.start()
    Bijou.run()
  }

  tick() {
    if (isOn) {
      Projector.addPixel(off)
      isOn = false
    } else {
      Projector.addPixel(on)
      isOn = true
    }
  }  
}