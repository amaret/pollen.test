
from atmel.atmega import ATmega328 as Mcu
from Mcu import PB5
from Mcu import Uart

module Test_02 {
  
  host Test_02() {
    Mcu.setFrequencyOnHost(16000000)
    Uart.setBaudOnHost(38400)

    print "UART Baud = " + Uart.getBaudOnHost() + "\n"
  }

  Test_02() {
    PB5.clear()
    PB5.makeOutput()    
  }

  pollen.run() {
    byte b, c
    while(true) {
      if (Uart.hasData()) {
        
        b = Uart.get()        

        if (b == 'x') {
          PB5.set()
        } else {
          PB5.clear()
        }        

        Uart.put(b)
      }
    }
  }
}