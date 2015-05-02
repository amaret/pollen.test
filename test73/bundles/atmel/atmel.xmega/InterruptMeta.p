package atmel.xmega

from pollen.hardware import InterruptSourceProtocol
from pollen.hardware import HandlerProtocol as HP

meta { string name,
       string peripheral, 
       string enableRegister, 
       string enableMask, 
       string flagRegister, 
       string flagMask }   

module InterruptMeta implements InterruptSourceProtocol {

  +{ #include <avr/io.h> }+
  +{ #include <avr/interrupt.h> }+

  # define the interrupt service routine
  +{ ISR(`name`_vect) { `handler`(); } }+

  host InterruptMeta() {
  }

  InterruptMeta() {
  }

  public host setHandlerOnHost(HP.handler h) { handler = h }

  public setHandler(HP.handler h) {
    handler = h
  }

  public enable() {
    +{ `peripheral`.`enableRegister` |= `enableMask` }+
  }

  public disable() {
    if (isEnabled()) {
      +{`peripheral`.`enableRegister` &= ~`enableMask`}+
    }
  }

  public clear() { 
    # Writing 1 to the interrupt bit clears it 
    +{ `peripheral`.`flagRegister` |= `flagMask` }+    
  }
  
  public bool isEnabled() {
    return +{ `peripheral`.`enableRegister` & `enableMask` }+
  }

  !-- Private Members --!
  host HP.handler() handler

} 
