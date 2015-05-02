package atmel.atmega

from pollen.hardware import GlobalInterruptsProtocol

module GlobalInterrupts implements GlobalInterruptsProtocol {
  
  +{ #include <avr/interrupt.h> }+

  public disable() {
    +{ cli() }+
  }

  public enable() {
    +{ sei() }+
  }

}