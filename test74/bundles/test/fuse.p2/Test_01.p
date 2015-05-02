
from atmel.atmega import ATmega88 as Mcu
from Mcu import PD5
from Mcu import PD6
from Mcu import PD7 

module Test_01 {
  
  pollen.ready() {
    PD5.clear()
    PD6.clear()
    PD7.clear()

    PD5.makeOutput() 
    PD6.makeOutput()     
    PD7.makeOutput()     
  }

  pollen.run() {    

    while(true) {
      PD5.set()
      PD6.clear()
      PD7.clear()
      delay()

      PD5.clear()
      PD6.set()
      PD7.clear()
      delay()

      PD5.clear()
      PD6.clear()
      PD7.set()
      delay()

      PD5.set()
      PD6.clear()
      PD7.set()
      delay()

      PD5.set()
      PD6.set()
      PD7.clear()
      delay()

      PD5.clear()
      PD6.set()
      PD7.set()
      delay()

      PD5.set()
      PD6.set()
      PD7.set()
      delay()

    }    
  }

  delay() {
    for (uint8 i = 0; i < 255; i++) {
      Mcu.wait(1000)
    }
  }
}
