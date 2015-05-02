from atmel.atmega import ATmega88 as Mcu
from Mcu import GlobalInterrupts
from Mcu import Timer0Overflow
from Mcu import Uart
from Mcu import PD5
from Mcu import PD6
from Mcu import PD7

module Test_07 {

  +{ #include <avr/io.h> }+
  +{ #include <avr/interrupt.h> }+ 
  +{ #include <avr/wdt.h> }+

    // PWM Channel arrays
  host uint8 CHMAX = 3
  uint8 compare[3]
  volatile uint8 compbuff[3]

  // default PWM value at start up for all channels
  const uint8 PWMDEFAULT = 0x0F  

  // soft counter
  uint8 softcount = 0

  host Test_07() {
    Mcu.setFrequencyOnHost(8000000)
    Uart.setBaudOnHost(38400)
  }

  Test_07() {   
    Timer0Overflow.setHandler(tick)    // register the interrupt service routine

    PD5.clear()
    PD6.clear()
    PD7.clear()    

    PD5.makeOutput()
    PD6.makeOutput()
    PD7.makeOutput()    

    uint8 pwm = PWMDEFAULT

    for (i = 0; i < CHMAX; i++) {      // initialise all channels    
      compare[i] = pwm;                // set default PWM values
      compbuff[i] = pwm;               // set default PWM values
    }

  }

  pollen.run() {
    Timer0Overflow.clear()
    Timer0Overflow.enable()
    +{ TCCR0B = (1 << CS00) }+   // start timer, no prescale
    GlobalInterrupts.enable()

    byte rchan, gchan, bchan, cmd

    while(true) {
      if (Uart.hasData()) {

        cmd = Uart.get()

        if (cmd == '#') {
          rchan = Uart.get()
          gchan = Uart.get()
          bchan = Uart.get()

          compbuff[0] = rchan
          compbuff[1] = gchan
          compbuff[2] = bchan
        }
      }
    }   
  }

  tick() {

    if(++softcount == 0) {         // increment modulo 256 counter and update
                                  // the compare values only when counter = 0.
      compare[0] = compbuff[0];   // verbose code for speed
      compare[1] = compbuff[1];
      compare[2] = compbuff[2];   // last element should equal CHMAX - 1

      PD5.set()
      PD6.set()
      PD7.set()      
    }

    // clear port pin on compare match (executed on next interrupt)
    if(compare[0] == softcount) { PD5.clear() }
    if(compare[1] == softcount) { PD6.clear() }
    if(compare[2] == softcount) { PD7.clear() }
  
  }

}