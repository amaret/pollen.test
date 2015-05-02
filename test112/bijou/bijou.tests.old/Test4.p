import pollen.environment as Bijou

from bijou.parts import Projector
from pollen.time import Timer
from bijou.parts import Pixel
from bijou.parts import Frame

module Test4 {

  host Timer t1 = new Timer(tick)
  host Frame f1 = new Frame(FrameType.Still)
  host Frame f2 = new Pixel(FrameType.Still)
  bool dirUp = true

  Test4() {
    f1.setFramePixelRGB(0, 0, 0)
    f2.setFramePixelRGB(255, 255, 255)
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {

    t1.start(500, true)
    Projector.start()
    Bijou.run()
  }

  tick() {
    if (dirUp) {
      Projector.addFrame(f2)
      dirUp = false
    } else {
      Projector.addPixel(f1)
      dirUp = true
    }
  }  

}