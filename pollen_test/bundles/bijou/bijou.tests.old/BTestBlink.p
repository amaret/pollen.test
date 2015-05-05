from bijou.boards import BijouTest as Bijou

from Bijou import PC10 as Led1
from Bijou import PC11 as Led2


module BTestBlink {

  BTestBlink() {
    Led1.makeOutput()
    Led1.clear()

    Led2.makeOutput()
    Led2.clear()
  }

  pollen.reset() {
    Bijou.reset()        
  }
  
  pollen.run() {
    while(true) {    
      Led1.toggle()
      Led2.toggle()
      delay()
    }
  }

  delay() { 
    for (uint16 i = 0; i < 500; ++i) {
      Bijou.wait(750)
    }
  }

}