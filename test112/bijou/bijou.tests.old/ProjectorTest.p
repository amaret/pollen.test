import pollen.environment as Bijou

//from pollen.time import Timer
//from bijou.parts import Pixel
//from bijou.parts import Frame
//from bijou.parts import Lookup
from bijou.parts import Projector

module ProjectorTest {
  
  // host Frame f1 = new Frame(1000, 10, gamma)
  // host Frame f2 = new Frame(1000, 50, sine)
  // host Frame f3 = new Frame(1000, 100, test)  


  // int16 counts[3] = { 0, 0, 0 }
  // uint8 step = 1

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    //Projector.addFrame(f1)
    // Projector.addFrame(f2)
    // Projector.addFrame(f3)
    Projector.start()
    Bijou.run()
  }


  // gamma() {
  //   uint8 val = Lookup.gamma(counts[0])
  //   if (counts[0] + step >= 255) { 
  //     counts[0] = 0 
  //     val = 0
  //   }
  //   // Pixel p = f1.getPixel()
  //   // p.setRed(val)
  // }

  // sine() {
  //   uint8 val = Lookup.sine(counts[1])
  //   if (counts[1] + step >= 255) { 
  //     counts[1] = 0 
  //     val = 0
  //   }
  //   Pixel p = f2.getPixel()
  //   p.setGreen(val)
  // }

  // test() {
  //   uint8 val = Lookup.test(counts[2])
  //   if (counts[2] + step >= 255) { 
  //     counts[2] = 0 
  //     val = 0
  //   }
  //   Pixel p = f3.getPixel()
  //   p.setBlue(val)
  // }

}