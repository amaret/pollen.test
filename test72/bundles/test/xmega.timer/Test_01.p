
from atmel.xmega import ATxmega16C4 as Mcu
from Mcu import PA0

module Test_01 {
  
  pollen.ready() {
    PA0.set()           # LED is active low
    PA0.makeOutput()


    # clear all TC0 interrupts & errors, set timer overflow interrupt level (enabling interrupt)
    +{ TCC0.INTFLAGS |= TC0_OVFIF_bm | TC0_ERRIF_bm }+
  }

  # Inject the interrupt handler here.
  +{
    ISR(TCC0_OVF_vect) {
      if (++`count` == 50) {
        `PA0.toggle`();
        `count` = 0;
      }
    }
  }+


  pollen.run() {
    
    # set clock period
    +{ TCC0.PER  = `period` }+

    # enable interrupts on TC0 Oveflow 
    +{ TCC0.INTCTRLA = TC_OVFINTLVL_LO_gc }+

    # enable low level interrupts in the PMIC
    +{ PMIC.CTRL |= PMIC_LOLVLEN_bm }+ 

    # start the clock
    +{ TCC0.CTRLA = (TCC0.CTRLA & ~TC0_CLKSEL_gm) | TC_CLKSEL_DIV1_gc }+            // Start Timer with no prescaling
    
    # enable global interrupts.
    Mcu.GlobalInterrupts.enable()

    while (1) {    
    }

  }

  host uint16 period = 0x7ff
  uint8 count = 0 

}