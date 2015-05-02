
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
  const uint8 RCHAN = 0
  const uint8 GCHAN = 1
  const uint8 BCHAN = 2

  uint8 compare[3]
  volatile uint8 compbuff[3]

  uint8 currentRed, curretGreen, currentBlue
  bool pulseStarted = false
  uint16 fadeUpTime = 1000 
  uint16 fadeDownTime = 1000

  // default PWM value at start up for all channels
  host uint8 PWMDEFAULT = 0x80  

  // soft counter
  uint8 softcount = 0

  +{ 
      ISR(TIMER0_OVF_vect) { `tick`(); } 
  }+

  Test_06() {
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

    byte cmd, rchan, gchan, bchan

    while(true) {

      cmd = receive()

      if (cmd == '#') {         // Set color
        currentRed = receive()
        currentGreen = receive()
        currentBlue = receive()

        compbuff[0] = currentRed
        compbuff[1] = currentGreen
        compbuff[2] = currentBlue
      }

      elif (cmd == '!') {         // Set fade time

      }

      elif (cmd == '$') {         // Fade command
        if (receive() == '$') {   
          fadeToWhite()
        } else {                  
          fadeToColor()
        }
      }
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

  fadeToWhite() {
    min = getMin(currentRed, currentGreen, currentBlue)

    for (uint8 i = min; i < 255; ++i) {
      if (compbuff[RCHAN] < 255) { ++comparebuff[RCHAN] }
      if (compbuff[GCHAN] < 255) { ++comparebuff[GCHAN] }        
      if (compbuff[BCHAN] < 255) { ++comparebuff[BCHAN] }        
      delay(50)
    }
  }

  fadeToColor() {
    min = getMin(currentRed, currentGreen, currentBlue)
   
    for (uint8 i = 255; i >= min; --i) {
      if (compbuff[RCHAN] > currentRed)   { --comparebuff[RCHAN] }
      if (compbuff[GCHAN] > currentGreen) { --comparebuff[GCHAN] }        
      if (compbuff[BCHAN] > currentBlue)  { --comparebuff[BCHAN] }        
      delay(50)
  }

  uint8 getMin(uint8 r, uint8 g, uint8 b) {
    uint8 min

    if (r < g) { min = r } 
    else { min = g }
    if (b < min) { min = b }

    return min
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
