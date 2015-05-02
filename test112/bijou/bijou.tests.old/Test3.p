import pollen.environment as Bijou

from bijou.parts import Projector
from pollen.time import Timer
from bijou.parts import Pixel

module Test3 {

  host Timer t1 = new Timer(tick)

  const uint8 NumPixels = 25
  host Pixel pixels[NumPixels] = { new Pixel(0, 0, 0, 0) }
  host uint8 step = (255 / NumPixels)
  uint8 count = 0
  bool dirUp = true

  Test3() {
    Pixel p = null
    p = pixels[NumPixels - 1]
    p.setRGB(255, 0, 0)
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    t1.start(1000, true)
    Projector.start()
    Bijou.run()
  }

  tick() {
    Pixel p = null 
    uint8 i

    if (dirUp) {
      p = pixels[0]
      Projector.addPixel(p)
      // for (i = 0; i < NumPixels; i++) {
      //   p = pixels[i]
      //   p.setRGB(i*step, 0, 0)      
      //   Projector.addPixel(p)
      // }
      dirUp = false
    } else {
      p = pixels[NumPixels - 1]
      Projector.addPixel(p)
      // for (i = 0; i < NumPixels; i++) {
      //   p = pixels[i]
      //   p.setRGB(255 - (i*step), 0, 0)      
      //   Projector.addPixel(p)
      // }
      dirUp = true
    }
  }  

}