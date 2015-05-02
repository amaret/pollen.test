from bijou.boards import BijouTest as Bijou

from Bijou import PC10 as Led1

module TimerTest00 {
  
  +{ #include <em_timer.c> }+

  +{
    #define TOP 15000

    void TIMER0_IRQHandler(void) { 
      /* Store the interrupt flags before clearing */
      uint32_t intFlags = TIMER_IntGet(TIMER0);
  
      /* Clear the interrupt flags. Only clear the flags that were stored in */
      /* intFlags in case other flags have been set since then */
      TIMER_IntClear(TIMER0, intFlags);
      `timerIRQ`();
    }
  }+

  pollen.reset() {
    Bijou.reset()
  }

  TimerTest00() {
    Led1.makeOutput()
    Led1.set()
  }

  timerIRQ() {
    Led1.toggle()
  }

  initTimer() {
    +{
      TIMER_Init_TypeDef initValues = TIMER_INIT_DEFAULT;

      /* Enable clock for TIMER0 */
      CMU_ClockEnable(cmuClock_TIMER0, true);

      /* Enable underflow and overflow interrupt for TIMER0*/
      TIMER_IntEnable(TIMER0, TIMER_IF_OF);
      TIMER_IntEnable(TIMER0, TIMER_IF_UF);

      /* Enable TIMER0 interrupt vector in NVIC */
      NVIC_EnableIRQ(TIMER0_IRQn);

      /* Set TIMER0 Top value */
      TIMER_TopSet(TIMER0, TOP);

      /* Initialize TIMER0 in Up/Down mode with 1024x prescaling, enable on init */
      initValues.prescale = timerPrescale1024;
      initValues.mode     = timerModeUpDown;
      initValues.enable     = true;
      TIMER_Init(TIMER0, &initValues);
    }+
  }

  pollen.run() {
    initTimer()

    while(1) {
      +{ EMU_EnterEM1(); }+
    }
  }

}
