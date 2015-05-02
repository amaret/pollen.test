#package basic

!-------------------------------------------------------------------------------
 Device driver for general purpose input/output pin P1.0 on the msp430 launchpad
 ------------------------------------------------------------------------------!

import Pin

module MspPin implements Pin {

  +{ #include <msp430g2452.h> }+
    
  public set() {
    +{P1OUT}+ |= (1 << 0)
  }

  public clear() {
    +{P1OUT}+ &= ~(1 << 0)
  }
  
  public toggle() {
    +{P1OUT}+ ^= (1 << 0)
  } 
  
  public bool get() {
    return (+{P1IN}+ & (1 << 0)) ? true : false
  }
  
  public makeInput() {
    +{P1DIR}+ &= ~(1 << 0)
  }
  
  public bool isInput() {
    return (+{P1DIR}+ & (1 << 0)) ? false : true
  }
  
  public makeOutput() {
    +{P1DIR}+ |= (1 << 0)
  }
  
  public bool isOutput() {
    return (+{P1DIR}+ & (1 << 0)) ? true : false
  } 
}
