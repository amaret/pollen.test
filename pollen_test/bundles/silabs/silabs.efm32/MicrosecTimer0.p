package silabs.efm32

!--

Microsecond counter

--! 

from pollen.hardware import HardwareTimerProtocol
from pollen.hardware import HandlerProtocol
import Cpu

from silabs.efm32 import TimerInterruptMeta { "TIMER0", 
                                              "TIMER_IEN_OF", 
                                              "TIMER_IF_OF", 
                                              "TIMER_IFS_OF", 
                                              "TIMER_IFC_OF" } as T0Overflow

module MicrosecTimer0 implements HardwareTimerProtocol {
  
  +{
      #ifndef __EFM32_TIMER__
      #define __EFM32_TIMER__
        #include "em_cmu.h"
        #include "em_timer.c"
      #endif
  }+

  host uint16 ticksPerIsr = 0  
  bool periodic = false
  bool enabled = false

  HandlerProtocol.handler() usHandler = null

  host MicrosecTimer0() { 
    T0Overflow.setHandlerOnHost(usTimerHandler)    
  }
    
  MicrosecTimer0() {    
    // +{       
    //   // Select TIMER0 parameters - Up/Down mode with 64x prescaling 
    //   TIMER_Init_TypeDef timerInit = TIMER_INIT_DEFAULT;
    //   timerInit.prescale = timerPrescale64;         
    //   timerInit.mode     = timerModeUpDown;
    //   timerInit.enable   = false;
    //   TIMER_Init(TIMER0, &timerInit);
    // }+

    T0Overflow.disable()
  }

  public host configureOnHost(uint16 duration, HandlerProtocol.handler isr, bool repeat) {
    // Should find a nifty way to calculate the best prescale value based on the % error deviation 
    // from the actual desired frequency
    ticksPerIsr = (duration / (64 / (Cpu.getFrequencyOnHost() / 1000000))) / 2
    usHandler = isr
    periodic = repeat
    //print "TICKS PER ISR=" + ticksPerIsr + "\n"
  }

  public configure(uint16 duration, HandlerProtocol.handler isr, bool repeat) {
    ticksPerIsr = (duration / (64 / (Cpu.getFrequency() / 1000000))) / 2
    usHandler = isr
    periodic = repeat    
  }

  public host setHandlerOnHost(HandlerProtocol.handler h) {
    usHandler = h
  }

  public setHandler(HandlerProtocol.handler h) {
    usHandler = h
  }

  public start() {    
    if (enabled == false && ticksPerIsr > 0) {      

      +{ 
        CMU_ClockEnable(cmuClock_TIMER0, true);     // Enable clock for TIMER0 module      
         
        // Select TIMER0 parameters - Up/Down mode with 64x prescaling 
        TIMER_Init_TypeDef timerInit = TIMER_INIT_DEFAULT;
        timerInit.prescale = timerPrescale64;         
        timerInit.mode     = timerModeUpDown;
        timerInit.enable   = true;

        TIMER_TopSet(TIMER0, `ticksPerIsr`);                // Set TIMER Top value          
        TIMER_CounterSet(TIMER0, 0);     
        TIMER_Init(TIMER0, &timerInit);
      }+
      enabled = true        
      T0Overflow.enable()
    }    
  }

  public stop() {
    T0Overflow.disable()
   +{ TIMER_Enable(TIMER0, false) }+ 
   +{ CMU_ClockEnable(cmuClock_TIMER0, false) }+     // disable clock for TIMER0 module
   enabled = false
  }

  public bool isRunning() { 
    return enabled
  }

  //---------------------------------------------------------------------------
  // Private functions 
  //-----------------------

  //---------------------------------------------------------------------------
  // Interrupt service routine
  //---------------------------------------------------------------------------
  usTimerHandler() {    
    T0Overflow.clear()

    if (!periodic) { stop() }
    if (usHandler != null) { usHandler() }          
  }  

}