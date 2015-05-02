from atmel.atmega import ATmega168 as Mcu
from Mcu import GlobalInterrupts
from Mcu import PB5

module Test_01 {

  +{ #include <avr/io.h> }+

  Test_01() {
    // For 16 mhz clock, to set 38400 baud, UBBR = 0x0019
    // For 8 mhz clock, to set 38400 baud, UBBR = 0x000C

    // Set the baud rate
    +{ UBRR0H }+ = 0x00
    +{ UBRR0L }+ = 0x19
    +{ UCSR0B = ((1 << RXEN0) | (1 << TXEN0)) }+   // Enable UART receiver and transmitter    
    +{ UCSR0C = (1<<UCSZ01)|(1<<UCSZ00) }+         // Set frame format: 8 data, 1 stop
  }

  pollen.run() {
    byte data

    while (true) {
      data = receive()
      transmit(data)
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
