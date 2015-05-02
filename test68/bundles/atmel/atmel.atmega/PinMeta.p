package atmel.atmega

!-- 
  Implementation of a meta module for pin drivers
 --!

from pollen.hardware import PinProtocol

meta {string port, uint8 pin}
module PinMeta implements PinProtocol {
  
  +{ #include <avr/io.h> }+

  host uint8 pinMask

  host PinMeta() {
    pinMask = (1 << pin)  
  }

  public set() {                        
    +{ PORT`port` |= `pinMask` }+
  }

  public clear() {                     
    +{ PORT`port` &= ~`pinMask` }+
  }

  public toggle() {                   
    +{ PORT`port` ^= `pinMask` }+ 
  }

  public bool get() {                 
    return +{ (PORT`port` & `pinMask`) }+ ? true : false
  }

  public bool isInput() {
    return +{ DDR`port` & `pinMask` }+ ? false : true
  }              
  
  public bool isOutput() {
    return +{ DDR`port` & `pinMask` }+ ? true : false
  }    
  
  public makeInput() {
    +{ DDR`port` &= ~`pinMask` }+
  }
  
  public makeOutput() {
    +{ DDR`port` |= `pinMask` }+
  }
}