# TEST that use of Gpio composition for one instance of pin
# TEST does NOT cause generation of all composition pins
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
