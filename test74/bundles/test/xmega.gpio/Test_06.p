
from atmel.xmega import ATxmega16C4 as Mcu
from Mcu import PA0

module Test_06 {
  
  pollen.ready() {
    PA0.set()
    PA0.makeOutput() 
  }

  pollen.run() {    
    while(true) {
      PA0.toggle()
      delay()
    }    
  }

  delay() {
    for (uint8 i = 0; i < 5; i++) {
      Mcu.wait(1000)
    }
  }
}
