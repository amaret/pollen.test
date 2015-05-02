
from atmel.xmega import ATxmega16C4 as Mcu
from Mcu import PA0

module Test_00 {
  
  pollen.ready() {
    PA0.set()           # LED is active low
    PA0.makeOutput()

    +{ TCC0.PER  = `period` }+
    +{ TCC0.CTRLA = (TCC0.CTRLA & ~TC0_CLKSEL_gm) | TC_CLKSEL_DIV1_gc }+  // Start Timer with no prescaling
  }

  pollen.run() {
    while (1) {

      !-- Check if the overflow flag (OVFIF) is set, clear flag and toggle LEDs --!      
      if ( +{(TCC0.INTFLAGS & TC0_OVFIF_bm)}+ != 0) {
        +{ TCC0.INTFLAGS = TC0_OVFIF_bm }+      //Clear the IF by writing a logical 1 to the flag

        if (++count == 150) {          
          PA0.toggle()                            //Toggle LED
          count = 0
        }
      }       
    }

  }

  host uint16 period = 0x7d0
  uint16 count = 0
}