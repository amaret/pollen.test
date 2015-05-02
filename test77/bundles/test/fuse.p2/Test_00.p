
from atmel.atmega import ATmega88 as Mcu
from Mcu import PD5
from Mcu import PD6
from Mcu import PD7 

module Test_00 {
  
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
      PD5.toggle()
      PD6.toggle()
      PD7.toggle()

      delay()
    }    
  }

  delay() {
    for (uint8 i = 0; i < 250; i++) {
      Mcu.wait(1000)
    }
  }
}
