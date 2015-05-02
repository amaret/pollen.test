
from atmel.xmega import ATxmega16C4 as Mcu
from Mcu import PA0

module Test_03 {
  
  +{ #define F_CPU 2000000 }+
  +{ #include <util/delay.h> }+  

  pollen.ready() {
    PA0.clear()
    PA0.makeOutput()  
  }

  pollen.run() {    
    while(true) {
      PA0.set()
      +{ _delay_ms(200) }+
      PA0.clear()
      +{ _delay_ms(200) }+      
    }    
  }

}
