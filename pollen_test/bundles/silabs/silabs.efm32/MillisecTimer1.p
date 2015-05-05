package silabs.efm32

from pollen.hardware import HandlerProtocol
from pollen.hardware import HardwareTimerProtocol

import Cpu
from silabs.efm32 import TimerInterruptMeta { "TIMER1", 
                                              "TIMER_IEN_OF", 
                                              "TIMER_IF_OF", 
                                              "TIMER_IFS_OF", 
                                              "TIMER_IFC_OF" } as T1Overflow


module MillisecTimer1 implements HardwareTimerProtocol {
  
  +{
      #ifndef __EFM32_TIMER__
      #define __EFM32_TIMER__
        #include "em_cmu.h"
        #include "em_timer.c"
      #endif
  }+

  host uint16 ticksPerIsr = 0  
  bool enabled = false

  HandlerProtocol.handler() msHandler = null

  host MillisecTimer1() { 
    ticksPerIsr = 1 * (Cpu.getFrequencyOnHost() / (1000 * 128))
    //print "MillisecTimer1 Ticks per Isr=" + ticksPerIsr + "\n"
    T1Overflow.setHandlerOnHost(msTimerHandler)    
  }

  MillisecTimer1() {
  }

  public host setHandlerOnHost(HandlerProtocol.handler h) {
    msHandler = h
  }

  public setHandler(HandlerProtocol.handler h) {
    msHandler = h
  }

  public start() {    
    if (enabled == false && ticksPerIsr > 0) {      

      +{ 
        CMU_ClockEnable(cmuClock_TIMER1, true);     // Enable clock for TIMER1 module      
         
        // Select TIMER0 parameters - Up/Down mode with 64x prescaling 
        TIMER_Init_TypeDef timerInit = TIMER_INIT_DEFAULT;
        timerInit.prescale = timerPrescale128;         
        timerInit.mode     = timerModeUpDown;
        timerInit.enable   = true;

        TIMER_TopSet(TIMER1, `ticksPerIsr`);                // Set TIMER Top value          
        TIMER_CounterSet(TIMER1, 0);     
        TIMER_Init(TIMER1, &timerInit);
      }+
      enabled = true        
      T1Overflow.enable()
    }    
  }

  public stop() {
    T1Overflow.disable()
   +{ TIMER_Enable(TIMER1, false) }+ 
   +{ CMU_ClockEnable(cmuClock_TIMER1, false) }+     // disable clock for TIMER0 module
   enabled = false
  }

  public bool isRunning() {
    return enabled
  }

  //---------------------------------------------------------------------------
  // Interrupt service routine
  //---------------------------------------------------------------------------

  msTimerHandler() {    
    T1Overflow.clear()
    if (msHandler != null) { msHandler() }          
  }  
}