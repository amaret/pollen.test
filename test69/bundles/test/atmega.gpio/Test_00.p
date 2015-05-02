from atmel.atmega import ATmega168 as Mcu

from Mcu import PB4

module Test_00 {
  
  pollen.ready() {
    PB4.clear()
    PB4.makeOutput() 
  }

  pollen.run() {    
    while(true) {
      +{
        PORTB |= (1 << 4);
        __asm__ __volatile__ ("nop");
        PORTB &= ~(1 << 4); 
        __asm__ __volatile__ ("nop");        
      }+
    }    
  }

}
