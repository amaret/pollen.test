
from atmel.atmega import ATmega88 as Mcu
from Mcu import PD5
from Mcu import PD6
from Mcu import PD7 

module Test_02 {
  
  pollen.ready() {
    PD5.clear()
    PD6.clear()
    PD7.clear()

    PD5.makeOutput() 
    PD6.makeOutput()     
    PD7.makeOutput()     
  }

  pollen.run() {    
    uint16 i

    while(true) {

      for (i = 0; i < 500; i++) {
        PD5.set()
        Mcu.wait(i)
        PD5.clear()
        Mcu.wait(500 - i)
      }

    }    
  }

  delay() {
    for (uint8 i = 0; i < 5; i++) {
      Mcu.wait(500)
    }
  }
}
