

from atmel.atmega import ATmega168 as Mcu
from Mcu import GlobalInterrupts
from Mcu import Timer0Overflow
from Mcu import PD2
from Mcu import PD3
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
  const uint8 RCHAN = 2
  const uint8 GCHAN = 0
  const uint8 BCHAN = 1

  // default PWM value at start up for all channels
  host uint8 PWMDEFAULT = 0x80  
  uint8 currentRed = 0
  uint8 currentGreen = 0
  uint8 currentBlue = 0

  // soft counters
  uint8 softcount = 0
  uint8 fadecount = 0

  // fade control counts & flags
  const uint8 ticksPerMs = 32
  uint16 fadeDuration = 1000
  uint16 fadeCount = 0

  uint8 fadeInterval = 0 
  uint8 intervalCount = 0

  const uint8 NOFADE = 0
  const uint8 FADEWHITE = 1
  const uint8 FADECOLOR = 2
  uint8 fading = NOFADE

  Test_04() {
    uint8 pwm = PWMDEFAULT

    Timer0Overflow.setHandler(tick)

    // This is not necessary! Prescaler is set to zero by default unless CLKDIV8 fuse is programmed 
    +{ CLKPR = (1 << CLKPCE) }+    // enable clock prescaler update
    if (Mcu.getFrequency() == 16000000) {
      +{ CLKPR }+ = 0x01                // divide clock by 2 on 16 MHZ frequency. 
    } else {
      +{ CLKPR }+ = 0x00
    }

    // For 8 mhz clock, to set 38400 baud with x2U = 0, UBBR = 0x000C
    //                  to set 38400 baud with x2U = 1, UBBR = 0x0019
    // Set the baud rate
    +{ UBRR0L }+ = 0x0C
    +{ UBRR0H }+ = 0x00
    +{ UCSR0B = ((1 << RXEN0) | (1 << TXEN0)) }+   // Enable UART receiver and transmitter    
    +{ UCSR0C = (1<<UCSZ01)|(1<<UCSZ00) }+         // Set frame format: 8 data, 1 stop

    PD2.clear()
    PD3.clear()
    PD5.clear()
    PD6.clear()
    PD7.clear()    

    PD2.makeOutput()
    PD3.makeOutput()
    PD5.makeOutput()
    PD6.makeOutput()
    PD7.makeOutput()    

    for (i = 0; i < CHMAX; i++) {      // initialise all channels    
      compare[i] = pwm                 // set default PWM values
      compbuff[i] = pwm                // set default PWM values
    }

    compbuff[RCHAN] = 0
    compbuff[GCHAN] = 255
    compbuff[BCHAN] = 0
  }

  pollen.run() {

    +{
        TIFR0 = (1 << TOV0);           // clear interrupt flag
        TIMSK0 = (1 << TOIE0);         // enable overflow interrupt
        TCCR0B = (1 << CS00);         // start timer, no prescale
    }+

    GlobalInterrupts.enable()

    byte cmd

    while(true) {
      cmd = receive()

      if (cmd == '#') {
        currentRed = receive()
        currentGreen = receive()
        currentBlue = receive()

        compbuff[RCHAN] = currentRed
        compbuff[GCHAN] = currentGreen
        compbuff[BCHAN] = currentBlue
      } elif (cmd == '$') {
        if (receive() == '$') {     // start fade          
          doFade(FADEWHITE)
        } else {                    // stop fade
          doFade(FADECOLOR)
        }
      }
    }

  }

  tick() {
    if(++softcount == 0){         // increment modulo 256 counter and update
                                  // the compare values only when counter = 0.
      compare[0] = compbuff[0]   // verbose code for speed
      compare[1] = compbuff[1]
      compare[2] = compbuff[2]   // last element should equal CHMAX - 1

      PD5.set()
      PD6.set()
      PD7.set()      
    }

    // clear port pin on compare match (executed on next interrupt)
    if(compare[0] == softcount) { PD5.clear() }
    if(compare[1] == softcount) { PD6.clear() }
    if(compare[2] == softcount) { PD7.clear() }

    if ((fading != NOFADE) && (++fadecount == 32)) {
      fadecount = 0

      if (++intervalCount == fadeInterval) {
        intervalCount = 0
        fadeCount += fadeInterval

        if (fading == FADEWHITE) {
          //  if (compbuff[RCHAN] < 255) { compbuff[RCHAN] += 1 }
          //  if (compbuff[GCHAN] < 255) { compbuff[GCHAN] += 1 }          
          if (compbuff[BCHAN] < 255) { compbuff[BCHAN] += 1 } 
        } else {
          if (compbuff[BCHAN] > 0) { compbuff[BCHAN] -= 1 } 
        }

        if (fadeCount >= fadeDuration) {
          fading = (fading == FADEWHITE) ? FADECOLOR : FADEWHITE
          fadeCount = 0
          //PD2.clear()
        }
      }
    }
  }

  doFade(uint8 which) {
    fadecount = 0

    if (which == FADEWHITE) {
      //uint8 min = getMin(currentRed, currentGreen, currentBlue)
      fadeCount = intervalCount = 0
      fadeInterval = fadeDuration / 255 //(255 - min) / fadeDuration
      fading = FADEWHITE
      PD2.set()

    } elif (which == FADECOLOR) {
      // min = getMin(currentRed, currentGreen, currentBlue)

      // for (i = 255; i >= min; i++) {
      //   if (compbuff[RCHAN] > currentRed)   { --compbuff[RCHAN] }
      //   if (compbuff[GCHAN] > currentGreen) { --compbuff[GCHAN] }          
      //   if (compbuff[BCHAN] > currentBlue)  { --compbuff[BCHAN] }          
      // }
      fading = NOFADE
      //PD2.clear()      
    }

  }

  uint8 getMin(uint8 r, uint8 g, uint8 b) {
    uint8 min

    if (r < g) { min = r } 
    else { min = g }
    if (b < min) { min = b }

    return min
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
