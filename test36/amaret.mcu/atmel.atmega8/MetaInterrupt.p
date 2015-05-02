package atmel.atmega8

from pollen.hardware import InterruptSource
from pollen.hardware import InterruptHandler

meta { 
       string name, 
       string enableRegister, string enableBit, 
       string clearRegister, string clearBit 
}

module MetaInterrupt implements InterruptSource {

  +{ #include <avr/interrupt.h> }+

  InterruptHandler.isr handler
  
  +{
    ISR( name ) {
      (handler)();
    }
  }+

  public host setHandlerOnHost(InterruptHandler.isr h) {
    handler = h
  }

  public enable() {
    +{enableRegister}+ |= (1 << +{enableBit}+)
  }
  
  public disable() {
    +{enableRegister}+ &= ~(1 << +{enableBit}+)
  }

  public clear() {
    +{clearRegister}+ &= ~(1 << +{clearBit}+)
  }

  public isEnabled() {
    return +{enableRegister}+ & (1 << +{enableBit}+)
  }

}