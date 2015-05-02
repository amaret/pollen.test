from atmel.atmega import ATmega168 as Mcu
from Mcu import PD3 as D3
from Mcu import PD5 as D5
from Mcu import PD6 as D6
from Mcu import PD7 as D7


module Test_03 {

  Test_03() {
    D3.clear()
    //D5.set()
    //D6.set()
    D7.set()

    D3.makeOutput()
    D5.makeOutput()    
    D6.makeOutput()    
    D7.makeOutput()    
  }

  pollen.run() {

    //Mcu.wait(1000)
    while(true) {}
  }
}