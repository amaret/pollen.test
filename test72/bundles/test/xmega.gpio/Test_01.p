from atmel.xmega import ATxmega16C4 as Mcu

module Test_01 {
  
  +{ #define F_CPU 2000000 }+
  +{ #include <util/delay.h> }+  

  pollen.ready() {
    PA0.clear()
    PA0.makeOutput()
  }

  pollen.run() {
    while(true) {
      PA0.toggle()
      +{ _delay_ms(50) }+
    }
  }
}