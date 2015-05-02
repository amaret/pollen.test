package atmel.atmega8

from pollen.hardware import Uart as UartProtocol

#import Atmega328 as Core     # bug is preventing this from being usable
import Core

module Uart implements UartProtocol {

    +{ #include <avr/io.h> }+

    uint32 baudRate = 9600
  	host uint8 dataBits = 8
  	host uint8 stopBits = 1
  	host uint8 parity = 0

  	host uint8 baudh
  	host uint8 baudl

    !--
    host Uart() {
		  # Calculate initial values for default baud rate 
	    baudh = (((Core.getFrequencyOnHost() / (baudRate * 16)) - 1) >> 8)
	    baudl = (((Core.getFrequencyOnHost() / (baudRate * 16)) - 1))   
    }
    --!
    
    public Uart() {
	    +{UBRR0H}+ = 0        #baudh
	    +{UBRR0L}+ = 103    #baudl
    	+{UCSR0B = (1 << RXEN0) | (1 << TXEN0)}+    # Enable receiver and transmitter
    	# TODO: Set data, stop, parity bits from config params for now, 
    	# set 8 data bits, 1 stop bit, no parity
    	+{UCSR0C = (1 << UCSZ00) | (1 << UCSZ01)}+  
    	

    }
    
    public configure(uint32 baudRate, uint8 dataBits = 8, uint8 stopBits = 0, uint8 parity = 1) {
      # TODO
    }
    
    public host configureOnHost(uint32 baudRate, uint8 dataBits = 8, uint8 stopBits = 0, uint8 parity = 1) {
      # TODO 
    }
    
    public put(uint8 data) {
    	while (!(+{UCSR0A}+ & (1 << +{UDRE0}+))) { }
    	+{UDR0}+ = data
    }
    
    public uint8 get() {
	    while (!(+{UCSR0A}+ & (1 << +{RXC0}+))) { }  # Wait for data to be received
	    return +{UDR0}+                              # Get & return rcvd data from buffer    
    }
    
    public flush() {
	    volatile uint8 dummy = 0
	    while (+{UCSR0A}+ & (1 << +{RXC0}+)) { dummy = +{UDR0}+ }    
    }

    public setBaud(uint32 baud) {
		  baudRate = baud
	    +{UBRR0H}+ = (((Core.getFrequency() / (baudRate * 16)) - 1) >> 8)
	    +{UBRR0L}+ = (((Core.getFrequency() / (baudRate * 16)) - 1))    
    }
    
    public uint32 getBaud() { 
      return baudRate
    }
    
    public host setBaud(uint32 baud) {
		  baudRate = baud
	    baudh = (((Core.getFrequencyOnHost() / (baudRate * 16)) - 1) >> 8)
	    baudl = (((Core.getFrequencyOnHost() / (baudRate * 16)) - 1)) 
    }
    
}
