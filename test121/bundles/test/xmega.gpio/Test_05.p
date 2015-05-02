
from atmel.xmega import ATxmega16C4 as Mcu
from Mcu import PA0

module Test_05 {
  
  +{ #define F_CPU 2000000 }+
  +{ #include <util/delay.h> }+  

  pollen.ready() {
    PA0.set()
    PA0.makeOutput() 
  }

  pollen.run() {    
    while(true) {
      PA0.clear()
      delay()
      PA0.set()
      delay()
    }    
  }

  delay() {
    uint32 j

    for (uint32 i = 2000000; i > 0; --i) {
      Mcu.cycle()
    }
    #+{ _delay_ms(100) }+
  }

}
