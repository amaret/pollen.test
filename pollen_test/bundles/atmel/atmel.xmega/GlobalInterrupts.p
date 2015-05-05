package atmel.xmega

from pollen.hardware import GlobalInterruptsProtocol

module GlobalInterrupts implements GlobalInterruptsProtocol {
  
  +{ #include <avr/interrupt.h> }+

  public disable() {
    +{ cli() }+
  }

  public enable() {
    +{ sei() }+
  }

  public restore(bool state) {
    if (state) { +{ sei() }+ }
  }

  public bool isEnabled() {
    +{ __asm__ __volatile__("" ::: "memory"); }+
    return (+{ SREG }+ & 0x80) != 0
  }

}