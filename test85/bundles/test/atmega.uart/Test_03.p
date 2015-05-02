
from atmel.atmega import ATmega328 as Mcu
from Mcu import PB5
from Mcu import Uart

module Test_03 {
  
  uint16 fadeInTime
  uint16 fadeOutTime
  uint16 holdTime

  host Test_03() {
    Mcu.setFrequencyOnHost(16000000)
    Uart.setBaudOnHost(38400)

    print "UART Baud = " + Uart.getBaudOnHost() + "\n"
  }

  Test_03() {
    PB5.clear()
    PB5.makeOutput()    
  }

  pollen.run() {
    byte cmd, b

    while(true) {
      if (Uart.hasData()) {
        cmd = Uart.get()

        if (cmd == '$') {
          cmd = Uart.get()
          if (cmd == '$') {
            // get fade in duration, fade out duration, hold duration            
            fadeInTime = getUInt16()
            fadeOutTime = getUInt16()
            holdTime = getUInt16()

            putUInt16(fadeInTime)
            putUInt16(fadeOutTime)
            putUInt16(holdTime)

            PB5.toggle()
          }
        }
      }
    }
  }

  uint16 getUInt16() {    
    uint16 val    
    uint8 lo, hi

    lo = Uart.get()  // low byte
    hi = Uart.get()  // high byte
    val = hi
    val = (val << 8) | lo

    return val
  }

  putUInt16(uint16 val) {
    Uart.put(val)             // low byte
    Uart.put(val >> 8)        // high byte
  }
}