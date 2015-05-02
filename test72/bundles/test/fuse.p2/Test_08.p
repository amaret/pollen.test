from atmel.atmega import ATmega88 as Mcu
from Mcu import GlobalInterrupts
from Mcu import Timer0Overflow
from Mcu import Uart
from Mcu import PD5
from Mcu import PD6
from Mcu import PD7

from fuseproject import RGBLed

module Test_08 {

  // PWM Channel consts, arrays, data
  const uint8 RED = 0
  const uint8 GREEN = 1
  const uint8 BLUE = 2
  uint8 compare[3]
  volatile uint8 compbuff[3]
  const uint8 PWMDEFAULT = 0x0F  

  // soft counter
  uint8 softcount = 0

  host new RGBLed rgb(PWMDEFAULT, PWMDEFAULT, PWMDEFAULT)

  host Test_08() {
    Mcu.setFrequencyOnHost(8000000)
    Uart.setBaudOnHost(38400)
  }

  Test_08() {   
    Timer0Overflow.setHandler(tick)    // register the interrupt service routine

    PD5.clear()
    PD6.clear()
    PD7.clear()    

    PD5.makeOutput()
    PD6.makeOutput()
    PD7.makeOutput()    

    compare[RED]   = compbuff[RED]   = rgb.getRed()
    compare[GREEN] = compbuff[GREEN] = rgb.getGreen()
    compare[BLUE]  = compbuff[BLUE]  = rgb.getBlue()
  }

  pollen.run() {
    Timer0Overflow.clear()
    Timer0Overflow.enable()
    +{ TCCR0B = (1 << CS00) }+   // start timer, no prescale
    GlobalInterrupts.enable()

    byte cmd

    while(true) {
      if (Uart.hasData()) {
        cmd = Uart.get()

        if (cmd == '#') {
          rgb.setRed(Uart.get())
          rgb.setGreen(Uart.get())
          rgb.setBlue(Uart.get())

          compbuff[RED]   = rgb.getRed()
          compbuff[GREEN] = rgb.getGreen()
          compbuff[BLUE]  = rgb.getBlue()
        } 
      }
    }   
  }

  tick() {

    if(++softcount == 0) {         // increment modulo 256 counter and update
                                  // the compare values only when counter = 0.
      compare[RED]   = compbuff[RED];   // verbose code for speed
      compare[GREEN] = compbuff[GREEN];
      compare[BLUE]  = compbuff[BLUE];   // last element should equal CHMAX - 1

      PD5.set()
      PD6.set()
      PD7.set()      
    }

    // clear port pin on compare match (executed on next interrupt)
    if(compare[RED]   == softcount) { PD5.clear() }
    if(compare[GREEN] == softcount) { PD6.clear() }
    if(compare[BLUE]  == softcount) { PD7.clear() }
  }

}