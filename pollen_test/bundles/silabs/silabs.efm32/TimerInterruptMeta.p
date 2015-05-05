package silabs.efm32

!--
// To enable one or more interrupts, TIMERn_IEN register must be written with the corresponding interrupt enable bits. 
// Also, the NVIC vector for the corresponding interrupt line must be enabled.
// read from the TIMERn_IF
// cleared by writing TIMERn_IFC
//
// Interrupt Sources for the Timer: 
// Underflow - TIMER_IF_UF
// Overflow - TIMER_IF_OF
// Compare/Capture Channel 0 Interrupt - TIMER_IF_CC0
// Compare/Capture Channel 1 Interrupt - TIMER_IF_CC1
// Compare/Capture Channel 2 Interrupt - TIMER_IF_CC2
// Compare/Capture Channel 0 Input Capture Buffer Overflow Interrupt - TIMER_IF_ICBOF0
// Compare/Capture Channel 1 Input Capture Buffer Overflow Interrupt - TIMER_IF_ICBOF1
// Compare/Capture Channel 2 Input Capture Buffer Overflow Interrupt - TIMER_IF_ICBOF2
--!

from pollen.hardware import InterruptSourceProtocol
from pollen.hardware import HandlerProtocol

meta { string timer,
       string enableMask, 
       string interruptMask, 
       string setMask, 
       string clearMask
      }   

module TimerInterruptMeta implements InterruptSourceProtocol {

  +{ 
      #ifndef __EFM32_TIMER__
      #define __EFM32_TIMER__
        #include "em_timer.c"        
      #endif

      void `timer`_IRQHandler(void) { 
        `isr`(); 
      }
  }+

  HandlerProtocol.handler() isr = null

  public host setHandlerOnHost(HandlerProtocol.handler h) {
    isr = h
  }

  public setHandler(HandlerProtocol.handler h) {
    isr = h
  }

  public enable() {
    +{ TIMER_IntEnable(`timer`, `interruptMask`) }+
    +{ NVIC_EnableIRQ(`timer`_IRQn); }+              // Enable TIMERn interrupt vector in NVIC          
  }

  public disable() {
    +{ TIMER_IntDisable(`timer`, `interruptMask`) }+
  }

  public clear() {
    +{ TIMER_IntClear(`timer`, `interruptMask`) }+
  }

  public set() {
    +{ TIMER_IntSet(`timer`, `interruptMask`) }+
  }

  public bool get() {
    uint32 tmp
    tmp = +{ (`timer`->IEN) & `enableMask` }+;
    return tmp != 0
  }

  public bool isEnabled() {
    return +{ (`timer`->IEN & `enableMask`) != 0 }+
  }

}