package atmel.atmega8

from pollen.hardware import InterruptSource
from pollen.hardware import InterruptHandler
+{ #include <avr/interrupt.h> }+

meta { string name, 
       string enableRegister, string enableBit, 
       string clearRegister, string clearBit 
}

module MetaInterrupt implements InterruptSource {




  InterruptHandler.isr() handler

 // note 'name' is meta, need backticks
 // want to invoke the fcn via the fcn ptr
 // that member (handler) is going to get translated
 // from pollen into the c space
 // substitutions into the injection block
 // all names must be known in the pollen context
 // as they appear in injection block.

  +{  
      ISR( `name` ) { 
         (`handler`)();
      }   
  }+  


  public host setHandlerOnHost(InterruptHandler.isr h) {
    handler = h
  }

  public enable() {
    +{`enableRegister`}+ |= (1 << +{`enableBit`}+)
  }
  
  public disable() {
    +{`enableRegister`}+ &= ~(1 << +{`enableBit`}+)
  }

  public clear() {
    +{`clearRegister`}+ &= ~(1 << +{`clearBit`}+)
  }
  public bool isEnabled() {

    return +{`enableRegister`}+ & (1 << +{`enableBit`}+)
  }
}
