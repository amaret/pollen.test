package silabs.efm32

!--

Basic timer/counter module that counts up to a specified value and triggers an 
interrupt on overflow (i.e. when that value is reached. If no value is set, the
timer will interrupt when there is an overflow of the 16 bit counter. 

--! 

from pollen.hardware import HandlerProtocol
import Cpu

module TimerCounter {

  +{
      #ifndef __EFM32_TIMER__
      #define __EFM32_TIMER__
        #include "em_cmu.h"
        #include "em_timer.c"        
      #endif
  }+

  // Counter top value
  host uint16 top = 0
  HandlerProtocol.handler() clientHandler

  host TimerCounter() { }
    
  TimerCounter() {

    // Enable clock for TIMER0 module
    +{ CMU_ClockEnable(cmuClock_TIMER0, true) }+

    +{ // Select TIMER0 parameters
      TIMER_Init_TypeDef timerInit = TIMER_INIT_DEFAULT;

      /* Initialize TIMER0 in Up/Down mode with 1024x prescaling */
      timerInit.prescale = timerPrescale1024;
      timerInit.mode     = timerModeUpDown;
      TIMER_Init(TIMER0, &initValues);

      // {
      //   .enable     = true,                     // Enable timer when init complete.
      //   .debugRun   = true,                     // Stop counter during debug halt.
      //   .prescale   = timerPrescale1024,        // Prescaling. 
      //   .clkSel     = timerClkSelHFPerClk,      // Select clock source.
      //   .fallAction = timerInputActionNone,     // No action on falling input edge.
      //   .riseAction = timerInputActionNone,     // No action on rising input edge.
      //   .mode       = timerModeUp,              // Counting mode
      //   .dmaClrAct  = false,                    // Do not clear DMA requests when DMA channel is active.
      //   .quadModeX4 = false,                    // Select X2 quadrature decode mode (if used).
      //   .oneShot    = false,                    // Disable one shot.
      //   .sync       = false,                    // Not started/stopped/reloaded by other timers.
      // }
    }+

    // Enable overflow interrupt
    +{ TIMER_IntEnable(TIMER0, TIMER_IF_OF) }+

    // Enable TIMER0 interrupt vector in NVIC 
    +{ NVIC_EnableIRQ(`timerCounterISR`) }+
  
    // Set TIMER Top value
    +{ TIMER_TopSet(TIMER0, TOP) }+
  
    // Configure TIMER
    +{ TIMER_Init(TIMER0, &timerInit) }+

  }

  timerCounterISR() {   
    +{ TIMER_IntClear(TIMER0, TIMER_IF_OF) }+   // Clear flag for TIMER0 overflow interrupt 
  }

  public startPeriodic(uint32 counterTop) {
    
  }

}