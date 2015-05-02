
from atmel.atmega import ATmega168 as Mcu
from Mcu import PB4

module Test_01 {
  
  pollen.ready() {
    PB4.clear()
    PB4.makeOutput() 
  }

  pollen.run() {    
    while(true) {
      PB4.set()
      Mcu.cycle()
      PB4.clear()
      Mcu.cycle()
    }    
  }
}
