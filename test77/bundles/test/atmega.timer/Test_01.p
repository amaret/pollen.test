!--
  Test to make use of the Timer0Overflow interrupt module
 --!

 from atmel.atmega import ATmega168 as Mcu
 from Mcu import GlobalInterrupts
 from Mcu import Timer0Overflow
 from Mcu import PB5

 module Test_01 {

  uint16 softcount
  const uint16 COUNTMAX = 10000

  host Test_01() {
    Timer0Overflow.setHandlerOnHost(tick)
  }

  Test_01() {
    PB5.clear()
    PB5.makeOutput()
  }

  pollen.run() {

    //Timer0Overflow.setHandler(tick)
    Timer0Overflow.clear()
    Timer0Overflow.enable()

    +{ TCCR0B = (1 << CS00);         // start timer, no prescale  }+

    GlobalInterrupts.enable()

    while(true) { }
  }

  tick() {
    if (++softcount == COUNTMAX) {
      PB5.toggle()
      softcount = 0
    }
  }
 }