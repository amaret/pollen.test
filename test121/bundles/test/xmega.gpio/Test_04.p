
from atmel.xmega import ATxmega16C4 as Mcu
from Mcu import PA0
from Mcu import PA1

module Test_04 {
  
  +{ #define F_CPU 2000000 }+
  +{ #include <util/delay.h> }+  

  pollen.ready() {
    PA0.set()
    PA1.set()
    PA0.makeOutput() 
    PA1.makeOutput()
  }

  pollen.run() {    
    while(true) {
      PA0.clear()
      PA1.set()
      +{ _delay_ms(100) }+
      PA0.set()
      PA1.clear()      
      +{ _delay_ms(100) }+      
    }    
  }

}
