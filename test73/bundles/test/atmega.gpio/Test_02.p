
from atmel.atmega import ATmega168 as Mcu
from Mcu import PB5
from Mcu import PB4

module Test_02 {
  
  pollen.ready() {
    #PB5.set()
    #PB5.makeOutput() 

    PB4.clear()
    PB4.makeOutput() 
  }

  pollen.run() {    
    while(true) {
      #PB5.toggle()
      #delay()

      PB4.set()
      Mcu.cycle()
      PB4.clear()
      Mcu.cycle()
    }    
  }

  delay() {
    Mcu.wait(1000)
    #for (uint8 i = 0; i < 250; i++) {
    #  Mcu.wait(1000)
    #}
  }
}
