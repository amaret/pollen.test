package test29

!-------------------------------------------------------------------------------
 Device driver for general purpose input/output pin PB5 on the atmega328p micro.
 ------------------------------------------------------------------------------!

import Pin

module AvrPin implements Pin {

  +{ #include <avr/io.h> }+
  
  public set() {
    +{PORTB}+ |= (1 << 5)
  }

  public clear() {
    +{PORTB}+ &= ~(1 << 5)
  }
  
  public toggle() {
    +{PORTB}+ ^= (1 << 5)
  } 
  
  public bool get() {
    return (+{PORTB}+ & (1 << 5)) ? true : false
  }
  
  public makeInput() {
    +{DDRB}+ &= ~(1 << 5)
  }
  
  public bool isInput() {
    return (+{DDRB}+ & (1 << 5)) ? false : true
  }
  
  public makeOutput() {
    +{DDRB}+ |= (1 << 5)
  }
  
  public bool isOutput() {
    return (+{DDRB}+ & (1 << 5)) ? true : false
  } 
}
