from pollen.hardware import InterruptSourceProtocol
from pollen.hardware import HandlerProtocol

module Timer0OverflowInterrupt implements InterruptSourceProtocol {

  +{ #include "em_timer.c" }+

  HandlerProtocol.handler() isr = null  
  +{ void TIMER0_IRQHandler(void) { if (`isr` != null) { `isr`(); } } }+

  public host setHandlerOnHost(HandlerProtocol.handler h) { isr = h }

  public setHandler(HandlerProtocol.handler h) { isr = h }

  public enable() {
    +{ TIMER_IntEnable(TIMER0, TIMER_IEN_OF); }+
    +{ NVIC_EnableIRQ(TIMER0_IRQn); }+              // Enable TIMERn interrupt vector in NVIC          
  }

  public disable() {
    +{ TIMER_IntDisable(TIMER0, TIMER_IEN_OF) }+
  }

  public clear() {
    +{ TIMER_IntClear(TIMER0, TIMER_IFC_OF) }+
  }

  public set() {
    +{ TIMER_IntSet(TIMER0, TIMER_IFS_OF) }+
  }

  public bool get() {
    uint32 tmp
    tmp = +{ (TIMER0->IEN) & TIMER_IEN_OF }+;
    return tmp != 0
  }

  public bool isEnabled() {
    return +{ (TIMER0->IEN & TIMER_IEN_OF) != 0 }+
  }

}