package atmel.atmega8

from pollen.hardware import GlobalInterrupt as GI

module GlobalInterrupt implements GI {

  +{ #include <avr/interrupt.h }+

  public bool disable() {
    +{ cli() }+
    return +{SREG}+ & (1 << 7)
  }

  public enable() {
    +{ sei() }+
  }

  public restore(bool state) {
    if (state) {
      enable()
    } else {
      disable()
    }
  }
  

}