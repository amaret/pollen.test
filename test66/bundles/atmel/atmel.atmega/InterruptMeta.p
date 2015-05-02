package atmel.atmega

from pollen.hardware import InterruptSourceProtocol
from pollen.hardware import HandlerProtocol as Handlers

meta { string name, 
       string enableRegister, 
       string enableBit, 
       string flagRegister, 
       string flagBit }   

module InterruptMeta implements InterruptSourceProtocol {

  +{ #include <avr/io.h> }+
  +{ #include <avr/interrupt.h> }+

  # define the interrupt service routine
  +{ ISR(`name`) { `handler`(); } }+

  host InterruptMeta() {}

  InterruptMeta() {}

  public host setHandlerOnHost(Handlers.handler h) { handler = h }

  public setHandler(Handlers.handler h) { handler = h }

  public enable() { +{ `enableRegister` |= (1<<`enableBit`) }+ }

  public disable() { +{ `enableRegister` &= ~(1<<`enableBit`) }+ }

  public clear() { +{ `flagRegister` &= ~(1<<`flagBit`) }+ }
  
  public bool isEnabled() { return +{ `enableRegister` & (1<<`enableBit`) }+ }

  !-- Private Members --!
  host Handlers.handler() handler

} 