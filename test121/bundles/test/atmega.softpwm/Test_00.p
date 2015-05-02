
from atmel.atmega import ATmega168 as Mcu
from Mcu import GlobalInterrupts
from Mcu import PB5
from Mcu import PB4

module Test_00 {

  +{ #include <avr/io.h> }+
  +{ #include <avr/interrupt.h> }+ 
  +{ #include <avr/wdt.h> }+

  // PWM Channel arrays
  host uint8 CHMAX = 3
  uint8 compare[3]
  volatile uint8 compbuff[3]

  // default PWM value at start up for all channels
  host uint8 PWMDEFAULT = 0x80  

  // soft counter
  uint8 softcount = 0

  +{ 
      ISR(TIMER0_OVF_vect) { `tick`(); } 
  }+

  host Test_00() {
  }

  Test_00() {
    uint8 pwm = PWMDEFAULT

    // This is not necessary! Prescaler is set to zero by default unless CLKDIV8 fuse is programmed 
    +{ CLKPR = (1 << CLKPCE) }+    // enable clock prescaler update
    +{ CLKPR = 0 }+                     // set clock to maximum (= crystal)

    PB4.clear()
    PB5.clear()
    PB4.makeOutput()
    PB5.makeOutput()

    for (i = 0; i < CHMAX; i++) {      // initialise all channels    
      compare[i] = pwm;                // set default PWM values
      compbuff[i] = pwm;               // set default PWM values
    }

  }

  pollen.run() {

    +{
        TIFR0 = (1 << TOV0);           // clear interrupt flag
        TIMSK0 = (1 << TOIE0);         // enable overflow interrupt
        TCCR0B = (1 << CS00);         // start timer, no prescale
    }+

    GlobalInterrupts.enable()

    while(true) {
      // let the interrupts do the work. 
    }

  }

  tick() {
    if(++softcount == 0){         // increment modulo 256 counter and update
                                  // the compare values only when counter = 0.
      compare[0] = compbuff[0];   // verbose code for speed
      compare[1] = compbuff[1];
      compare[2] = compbuff[2];   // last element should equal CHMAX - 1

      PB4.set()
      PB5.set()
    }

    // clear port pin on compare match (executed on next interrupt)
    if(compare[0] == softcount) { PB4.clear() }
    if(compare[1] == softcount) { PB5.clear() }
    if(compare[2] == softcount) {  }
  }


  disableWatchdogTimer() {
    GlobalInterrupts.disable()
    +{
        wdt_reset();
        MCUSR &= ~(1 << WDRF);        // clear the watchdog reset flag
        WDTCSR |= (1<<WDCE)|(1<<WDE); // start timed sequence
        WDTCSR = 0x00;                // disable watchdog timer
    }+
    GlobalInterrupts.enable()
  }

}
