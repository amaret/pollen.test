from bijou.boards import BijouTest as Bijou

module TimerTest0 {

  +{

    #include <em_timer.c>

    #define LED_PORT gpioPortC
    #define LED_PIN  10
    #define TOP 1300

    void TIMER0_IRQHandler(void) { 
      /* Clear flag for TIMER0 overflow interrupt */
      TIMER_IntClear(TIMER0, TIMER_IF_OF);
  
      /* Toggle LED ON/OFF */
      GPIO_PinOutToggle(LED_PORT, LED_PIN);
    }
  }+


  pollen.run() {
    Bijou.reset()

    +{
      /* Enable clock for GPIO module */
      CMU_ClockEnable(cmuClock_GPIO, true);

      /* Enable clock for TIMER0 module */
      CMU_ClockEnable(cmuClock_TIMER0, true);

      /* Configure pin as push pull output for LED/pin drive */
      GPIO_PinModeSet(LED_PORT, LED_PIN, gpioModePushPullDrive, 0);

      /* Select TIMER0 parameters */  
      TIMER_Init_TypeDef timerInit =
      {
        .enable     = true, 
        .debugRun   = true, 
        .prescale   = timerPrescale1024, 
        .clkSel     = timerClkSelHFPerClk, 
        .fallAction = timerInputActionNone, 
        .riseAction = timerInputActionNone, 
        .mode       = timerModeUp, 
        .dmaClrAct  = false,
        .quadModeX4 = false, 
        .oneShot    = false, 
        .sync       = false, 
      };

      /* Enable overflow interrupt */
      TIMER_IntEnable(TIMER0, TIMER_IF_OF);

      /* Enable TIMER0 interrupt vector in NVIC */
      NVIC_EnableIRQ(TIMER0_IRQn);

      /* Set TIMER Top value */
      TIMER_TopSet(TIMER0, TOP);

      /* Configure TIMER */
      TIMER_Init(TIMER0, &timerInit);

      while(1)
      {
        /* Go to EM1 */
        EMU_EnterEM1();
      } 

    }+
  }

}