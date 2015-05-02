

module Test_00 {
  
  +{ #include <avr/io.h> }+

  +{ #define F_CPU 2000000 }+
  +{ #include <util/delay.h> }+  

  pollen.ready() {
    +{ PORTA_OUTCLR = (1 << 0) }+
    +{ PORTA_DIRSET = (1 << 0) }+
  }

  pollen.run() {
    while(true) {
      +{ PORTA_OUTTGL = (1 << 0) }+ 
      +{ _delay_ms(200) }+
    }

  }
}