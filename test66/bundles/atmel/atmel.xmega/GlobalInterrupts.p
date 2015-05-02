package atmel.xmega

from pollen.hardware import GlobalInterruptsP

module GlobalInterrupts implements GlobalInterruptsP {
  
  +{ #include <avr/interrupt.h> }+

  public disable() {
    +{ cli() }+
  }

  public enable() {
    +{ sei() }+
  }

}