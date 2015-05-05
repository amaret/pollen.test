

module TimerTest02 {
  
  +{
    #include "em_device.h"
    #include "em_system.c"
    #include "em_chip.h"
 
    #define LED_PORT     2   
    #define LED0_PIN     10
    #define LED1_PIN     10
    #define BLINK_PERIOD 500 // ms
 
    volatile uint16_t ms_counter = 0;
 
    void TIMER0_IRQHandler(void) {
      TIMER0->IFC = 1; // clear overflow flag
      ms_counter++;    // increment counter
    }
  }+
 
  pollen.run() {
    +{   
        CHIP_Init();
         
        CMU->HFRCOCTRL   = 0x8;                 // set HF RC oscillator to 1MHz
        CMU->HFPERCLKEN0 = (1 << 7) | (1 << 0); // enable GPIO and TIMER0 peripheral clocks
         
        GPIO->P[LED_PORT].MODEH = (4 << 8);     // set LED0 pin as push-pull output with standard drive strength
         
        TIMER0->TOP = 1000;                     // set top value for TIMER0
        TIMER0->IEN = 1;                        // enable TIMER0 overflow interrupt
         
        NVIC_EnableIRQ(TIMER0_IRQn);            // enable TIMER0 interrupt vector in NVIC
         
        TIMER0->CMD = 0x1;                      // start TIMER0
         
        while(1) {
          if(BLINK_PERIOD == ms_counter) {
            GPIO->P[LED_PORT].DOUTTGL = (1 << LED0_PIN); // toggle LED0
            ms_counter = 0;                              // reset counter
          }
        }
    }+
  }

}