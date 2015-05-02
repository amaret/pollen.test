
from atmel.atmega import ATmega88 as Mcu
from Mcu import GlobalInterrupts
from Mcu import PD5
from Mcu import PD6
from Mcu import PD7

module Test_04 {

  +{ #include <avr/io.h> }+
  +{ #include <avr/interrupt.h> }+ 
  +{ #include <avr/wdt.h> }+

  // PWM Channel arrays
  host uint8 CHMAX = 3
  uint8 compare[3]
  volatile uint8 compbuff[3]

  // default PWM value at start up for all channels
  host uint8 PWMDEFAULT = 0x0F  

  // soft counter
  uint8 softcount = 0

  +{ 
      ISR(TIMER0_OVF_vect) { `tick`(); } 
  }+

  Test_04() {
    uint8 pwm = PWMDEFAULT

    // This is not necessary! Prescaler is set to zero by default unless CLKDIV8 fuse is programmed 
    +{ CLKPR = (1 << CLKPCE) }+    // enable clock prescaler update
    +{ CLKPR = 0 }+                     // set clock to maximum (= crystal)

    disableWatchdogTimer()

    // For 8 mhz clock, to set 38400 baud with x2U = 0, UBBR = 0x000C
    //                  to set 38400 baud with x2U = 1, UBBR = 0x0019
    // Set the baud rate
    +{ UBRR0L }+ = 0x0C   // 0x19
    +{ UBRR0H }+ = 0x00
    +{ UCSR0B = ((1 << RXEN0) | (1 << TXEN0)) }+   // Enable UART receiver and transmitter    
    +{ UCSR0C = (1<<UCSZ01)|(1<<UCSZ00) }+         // Set frame format: 8 data, 1 stop


    PD5.clear()
    PD6.clear()
    PD7.clear()    

    PD5.makeOutput()
    PD6.makeOutput()
    PD7.makeOutput()    

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

    byte rchan, gchan, bchan

    while(true) {

      while (receive() != '#') {}
      rchan = receive()
      gchan = receive()
      bchan = receive()

      compbuff[0] = rchan
      compbuff[1] = gchan
      compbuff[2] = bchan

      // uint8 cmd = receive()

      // if (cmd == '#') {
      //   compbuff[0] = 0
      //   compbuff[1] = 0
      //   compbuff[2] = 0
      // } else {
      //   compbuff[0] = 20
      //   compbuff[1] = 0
      //   compbuff[2] = 0

      // }
    }

  }

  tick() {
    if(++softcount == 0){         // increment modulo 256 counter and update
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

  byte receive() {
    while ( +{ !(UCSR0A & (1<<RXC0)) }+ ) { }  // Wait for incoming data
    return +{ UDR0 }+                     // Return the data
  }

  transmit(byte data) {
    while ( +{ !(UCSR0A & (1<<UDRE0)) }+ ) { } // Wait for empty transmit buffer
    +{ UDR0 }+ = data;                           // Start transmittion
  }


}
