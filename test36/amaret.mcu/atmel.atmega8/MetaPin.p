!-----------------------------------------------------------------------------
  Meta-device driver for general purpose input/output pins on the ATmega8
  family of microcontrollers
------------------------------------------------------------------------------!

package atmel.atmega8

from pollen.hardware import Pin

meta {string portRegister, string directionRegister, uint8 bit}

module MetaPin implements Pin {

  +{ #include <avr/io.h> }+

  public set() { +{portRegister}+ |= (1 << bit) }

  public clear() { +{portRegister}+ &= ~(1 << bit) }

  public toggle() { +{portRegister}+ ^= (1 << bit) }	

  public bool get() { return (+{portRegister}+ & (1 << bit)) ? true : false }

  public makeInput() { +{directionRegister}+ &= ~(1 << bit) }

  public bool isInput() { return (+{directionRegister}+ & (1 << bit)) ? false : true }

  public makeOutput() { +{directionRegister}+ |= (1 << bit) }

  public bool isOutput() { return (+{directionRegister}+ & (1 << bit)) ? true : false }
	
}