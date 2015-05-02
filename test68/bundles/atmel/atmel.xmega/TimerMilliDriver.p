package atmel.xmega

from pollen.hardware import TimerMilliP
from pollen.hardware import HandlerP

import Cpu

module TimerMilliDriver implements TimerMilliP {

  !-- Inject the ISR that calls the handler --!

  +{ ISR(TCC0_OVF_vect) { `handler`() } }+
  
  TimerMilliDriver() {
    # clear all TC0 interrupts & errors, set timer overflow interrupt level (enabling interrupt)
    +{ TCC0.INTFLAGS |= TC0_OVFIF_bm | TC0_ERRIF_bm }+

  }

  public host TimerMilliDriver() {
    !-- 
      In the future this should determine if its necessary to use the prescaler
      and compute the necessary values for both period and the prescaler.
    --!

    # Set a millisecond frequency depending on the Cpu frequency
    period = Cpu.getFrequencyOnHost() / 1000  
  }

  public host setHandlerOnHost(BasicHandlers.EmptyHandler h) {
    handler = h
  }

  public start() {
  
  }
  
  public stop() {
  
  }
  
  public bool isRunning() {
  
  }

  !-- Private members --!

  host BasicHandlers.EmptyHandler handler
  host uint16 period

}

