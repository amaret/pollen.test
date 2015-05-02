package atmel.xmega

from pollen.hardware import InterruptSourceP
from pollen.hardware import HandlerP

meta { string name, 
       string enableRegister, 
       string enableMask, 
       string flagRegister, 
       string flagMask }   

module InterruptMeta implements InterruptSourceP {

  +{ #include <avr/io.h> }+
  +{ #include <avr/interrupt.h> }+

  # define the interrupt service routine
  +{ ISR(`name`) { `handler`() } }+

  host InterruptMeta() {
  }

  InterruptMeta() {
  }

  public host setHandlerOnHost(HandlerP.handler h) { handler = h }

  public enable() {
    +{ `name`.`enableRegister` |= `enableMask` }+
  }

  public disable() {
    if (isEnabled()) {
      +{`name`.`enableRegister` &= ~`enableMask`}+
    }
  }

  public clear() { 
    # Writing 1 to the interrupt bit clears it 
    +{ `name`.`flagRegister` |= `flagMask` }+    
  }
  
  public bool isEnabled() {
    return +{ `name`.`enableRegister` & `enableMask` }+
  }

  !-- Private Members --!
  host BasicHandlers.EmptyHandler handler

} 