from atmel.atmega import ATmega328 as Mcu
from Mcu import PB5
from Mcu import Uart

module Test_01 {
  
  host Test_01() {
    Mcu.setFrequencyOnHost(16000000)
    Uart.setBaudOnHost(38400)

    print "UART Baud = " + Uart.getBaudOnHost() + "\n"
  }

  Test_01() {
    PB5.clear()
    PB5.makeOutput()    
  }

  pollen.run() {

    while(true) {
      byte b = Uart.get()

      if (b == 'x') {
        PB5.set()
      } else {
        PB5.clear()
      }

      Uart.put(b)
    }
  }
}