
from bijou.boards import BijouTest as Bijou
from Bijou import PC10 as Led

from silabs.efm32 import TimerInterruptMeta { "TIMER0", 
                                              "TIMER_IEN_OF", 
                                              "TIMER_IF_OF", 
                                              "TIMER_IFS_OF", 
                                              "TIMER_IFC_OF" } as T0Overflow

//from silabs.efm32 import Timer0OverflowInterrupt as T0Overflow

module TimerTest1 {

  host uint16 TOP = 5000
  
  host TimerTest1() {
    T0Overflow.setHandlerOnHost(handler)
  }

  TimerTest1() {
    Led.makeOutput()
    Led.set()   
  } 

  pollen.reset() {
    Bijou.reset()
  }

  handler() {
    Led.toggle()
    T0Overflow.clear()
  }

  pollen.run() {

    +{
      TIMER_Init_TypeDef initValues = TIMER_INIT_DEFAULT;
      /* Enable clock for TIMER0 */
      CMU_ClockEnable(cmuClock_TIMER0, true);
    }+

    T0Overflow.enable()

    +{
      /* Set TIMER0 Top value */
      TIMER_TopSet(TIMER0, `TOP`);

      /* Initialize TIMER0 in Up/Down mode with 1024x prescaling, enable on init */
      initValues.prescale = timerPrescale1024;
      initValues.mode     = timerModeUpDown;
      initValues.enable     = true;
      TIMER_Init(TIMER0, &initValues);
    }+

    while(true) {
      +{ EMU_EnterEM1(); }+
    }

  }

}