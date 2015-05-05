

import pollen.environment as Bijou
//from Bijou import ColorLed

from Bijou import Led0      // Blue
from Bijou import Led1      // Red (but its pink)
from Bijou import Led2      //

//from pollen.time import Timer

module Test_5 {
  
//  host Timer t1 = new Timer(recolor)
//  uint8 count = 0

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {

    Led0.off()
    Led1.off()
    Led2.on()

    Bijou.run()
  }  

  // recolor(){    

  //   if (count == 0) {
  //     ColorLed.setRGB(255, 255, 255)
  //   } elif (count == 1) {
  //     ColorLed.setRGB(255, 0, 0)
  //   } elif (count == 2) {
  //     ColorLed.setRGB(0, 255, 0)
  //   } elif (count == 3) {
  //     ColorLed.setRGB(0, 0, 255)
  //   } else {
  //     ColorLed.setRGB(0, 0, 0)
  //     count = 0
  //   }

  //   count++
  // }


  // Here for when run on the host...
  //pollen.shutdown() {}

}