from atmel.atmega import ATmega88 as Mcu
from Mcu import GlobalInterrupts
from Mcu import PD5
from Mcu import PD6
from Mcu import PD7

module Test_05 {

  +{ #include <avr/io.h> }+
  +{ #include <avr/interrupt.h> }+ 
  +{ #include <avr/wdt.h> }+

  +{ #define F_CPU 8000000 }+
  +{ #include <util/delay.h> }+

  // PWM Channel arrays
  host uint8 CHMAX = 3
  uint8 compare[3]
  volatile uint8 compbuff[3]

  host uint8 fadeTable[101] = {0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 12, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25, 26, 28, 30, 31, 33, 35, 37, 39, 42, 44, 47, 49, 52, 55, 58, 62, 65, 69, 73, 77, 82, 87, 92, 97, 102, 108, 115, 121, 128, 136, 143, 152, 160, 169, 179, 190, 200, 212, 224, 237, 250}

  // default PWM value at start up for all channels
  host uint8 PWMDEFAULT = 0x80  

  // soft counter
  uint8 softcount = 0

  +{ 
      ISR(TIMER0_OVF_vect) { `tick`(); } 
  }+

  Test_05() {
    uint8 pwm = PWMDEFAULT

    // This is not necessary! Prescaler is set to zero by default unless CLKDIV8 fuse is programmed 
    +{ CLKPR = (1 << CLKPCE) }+    // enable clock prescaler update
    +{ CLKPR = 0 }+                     // set clock to maximum (= crystal)

    // For 8 mhz clock, to set 38400 baud with x2U = 0, UBBR = 0x000C
    //                  to set 38400 baud with x2U = 1, UBBR = 0x0019
    // Set the baud rate
    +{ UBRR0L }+ = 0x0C
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
      fadeUp()
      fadeDown()

      // while (receive() != '#') {}
      // rchan = receive()
      // gchan = receive()
      // bchan = receive()

      // compbuff[0] = rchan
      // compbuff[1] = gchan
      // compbuff[2] = bchan
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

  fadeUp() {
    for (i = 0; i <= 100; ++i) {
      compbuff[0] = compbuff[1] = compbuff[2] = fadeTable[i]
      delay(10)
    }
  }

  fadeDown() {
    for (i = 0; i <= 100 ; ++i) {
      compbuff[0] = compbuff[1] = compbuff[2] = fadeTable[100-i]
      delay(10)
    }
  }

  delay(uint16 ms) {
    +{ _delay_ms(ms) }+
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
