from atmel.atmega import ATmega168 as Mcu
from Mcu import GlobalInterrupts
from Mcu import PB5

module Test_02 {

  +{ #include <avr/io.h> }+

  Test_02() {
    // For 16 mhz clock, to set 38400 baud with x2U=0, UBBR = 0x0019
    //                   to set 38400 baud with x2U=1, UBBR = 0x0033
    // For 8 mhz clock, to set 38400 baud with x2U = 0, UBBR = 0x000C
    //                  to set 38400 baud with x2U = 1, UBBR = 0x0019

    // Set the baud rate
    +{ UBRR0L }+ = 0x19
    +{ UBRR0H }+ = 0x00
    +{ UCSR0C = (1<<UCSZ01)|(1<<UCSZ00) }+         // Set frame format: 8 data, 1 stop
    +{ UCSR0B = ((1 << RXEN0) | (1 << TXEN0)) }+   // Enable UART receiver and transmitter    
  }

  pollen.run() {
    byte rchan, bchan, gchan

    while (true) {

      while (receive() != '#') {}

      rchan = receive()
      gchan = receive()
      bchan = receive()

      transmit('#')
      transmit(rchan)
      transmit(gchan)
      transmit(bchan)
    }

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
