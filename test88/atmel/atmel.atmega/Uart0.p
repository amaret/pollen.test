from pollen.hardware import UartProtocol
import Cpu

module Uart0 implements UartProtocol {
  
  uint32 baudRate = 9600
  host uint8 dataBits = 8
  host uint8 stopBits = 1
  host uint8 parity = 0

  host uint8 baudh
  host uint8 baudl

  host bool baudSetOnHost = false

  host Uart0() {
    if (!baudSetOnHost) {
      setBaudOnHost(baudRate)
    }
  }

  Uart0() {
    +{ UBRR0H }+ = baudh
    +{ UBRR0L }+ = baudl
    +{ UCSR0B = (1 << RXEN0) | (1 << TXEN0) }+    // Enable UART receiver and transmitter

    // TODO: Set frame format from host params
    // set 8 data bits, 1 stop bit, no parity for now
    +{ UCSR0C = (1 << UCSZ01) | (1 << UCSZ00) }+  
  }

  public host configureOnHost(uint32 baudRate, uint8 dataBits = 8, uint8 stopBits = 0, uint8 parity = 1) {
    // TODO 
  }

  public configure(uint32 baudRate, uint8 dataBits = 8, uint8 stopBits = 0, uint8 parity = 1) {
    // TODO
  }

  public host setBaudOnHost(uint32 baud) {
    baudRate = baud

    // Calculate initial values for default baud rate 
    baudh = (((Cpu.getFrequencyOnHost() / (baudRate * 16)) - 1) >> 8)
    baudl = (((Cpu.getFrequencyOnHost() / (baudRate * 16)) - 1)) 

    print "Uart0: frequency=" + Cpu.getFrequencyOnHost() + " baud=" + baud + " baudh=" + baudh + " baudl=" + baudl + "\n"
    baudSetOnHost = true
  }

  public setBaud(uint32 baud) {
    baudRate = baud
    +{ UBRR0H }+ = (((Cpu.getFrequency() / (baudRate * 16)) - 1) >> 8)
    +{ UBRR0L }+ = (((Cpu.getFrequency() / (baudRate * 16)) - 1))    
  }
    
  public host uint32 getBaudOnHost() { 
    return baudRate
  }
  
  public uint32 getBaud() { 
    return baudRate
  }

  public put(byte data) {
    while ( !(+{ UCSR0A & (1 << UDRE0) }+) ) { }
    +{ UDR0 }+ = data
  }
  
  public byte get() {
    while ( !(+{ UCSR0A & (1 << RXC0) }+) ) { }     // Wait for data to be received
    return +{ UDR0 }+                                 // Get & return rcvd data from buffer    
  }
  
  public flush() {
    // TODO: uncomment when volatile keyword is working
    //volatile uint8 dummy = 0
    //while (+{ UCSR0A & (1 << RXC0) }+) { dummy = +{UDR0}+ }    
  }

  public bool hasData() {
    return (+{ UCSR0A & (1 << RXC0) }+) != 0
  }  

}
