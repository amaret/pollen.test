
module TimerTest01 {

+{
    #include "em_device.h"
    #include "em_system.c"
    #include "em_chip.h"
    #include "em_cmu.c"
    #include "em_gpio.c"
    #include "em_timer.c"
    #include "em_assert.c"
    #include "system_efm32zg.c"
 
    #define LED_PORT     gpioPortC
    #define LED0_PIN     10
    #define BLINK_PERIOD 500
 
    volatile uint16_t ms_counter = 0;
 
    void TIMER0_IRQHandler(void) {
      TIMER_IntClear(TIMER0, TIMER_IF_OF); // clear overflow flag
      ms_counter++;                        // increment counter
    }
}+

  pollen.run() {
    +{
        CHIP_Init();
         
        CMU_HFRCOBandSet(cmuHFRCOBand_14MHz);    // set HF RC oscillator to 1MHz
        CMU_ClockEnable(cmuClock_GPIO, true);   // enable GPIO peripheral clock
        CMU_ClockEnable(cmuClock_TIMER0, true); // enable TIMER0 peripheral clock
         
        GPIO_PinModeSet(LED_PORT, LED0_PIN, gpioModePushPullDrive, 0); // set LED0 pin as push-pull output with standard drive strength
         
        TIMER_Init_TypeDef timer0_init =
        {
          .enable     = true,                 // start timer upon configuration
          .debugRun   = true,                 // keep timer running even on debug halt
          .prescale   = timerPrescale1,       // use /1 prescaler; TIMER0 clock = HF clock = 1MHz
          .clkSel     = timerClkSelHFPerClk,  // set HF peripheral clock as clock source
          .fallAction = timerInputActionNone, // no action on falling edge
          .riseAction = timerInputActionNone, // no action on rising edge
          .mode       = timerModeUp,          // use up-count mode
          .dmaClrAct  = false,                // not using DMA
          .quadModeX4 = false,                // not using quad decoder
          .oneShot    = false,                // using continuous mode, not one-shot
          .sync       = false,                // not synchronizing with other timers
        };
        TIMER_TopSet(TIMER0, 1000);           // set TIMER0 top value
        TIMER_IntEnable(TIMER0, TIMER_IF_OF); // enable TIMER0 overflow interrupt
        NVIC_EnableIRQ(TIMER0_IRQn);          // enable TIMER0 interrupt vector in NVIC
        TIMER_Init(TIMER0, &timer0_init);     // apply configuration and start TIMER0
         
        while(1) {
          if(BLINK_PERIOD == ms_counter) {
            GPIO_PinOutToggle(LED_PORT, LED0_PIN); // toggle LED
            ms_counter = 0;                        // reset counter
          }
        }      
    }+
   }

}
