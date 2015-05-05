package atmel.atmega

from pollen.hardware import HandlerProtocol
from pollen.hardware import HardwareTimerProtocol
from pollen.hardware import InterruptSourceProtocol

import Cpu

module TimerMilliTC1 implements HardwareTimerProtocol {

  InterruptSourceProtocol TimerInterrupt
  host uint16 ticksPerMs = 0
  HandlerProtocol.handler() clientHandler

  host TimerMilliTC1() {
    !-- 
      In the future this should determine if its necessary to use the prescaler
      and compute the necessary values for both period and the prescaler.
    --!
    // Set a millisecond frequency depending on the Cpu frequency
    ticksPerMs = Cpu.getFrequencyOnHost() / (1000)
    print "TimerMilliTC1 setting ticksPerMs to: " + ticksPerMs + "\n"
  }

  TimerMilliTC1() {
    TimerInterrupt.setHandler(clientHandler)
    TimerInterrupt.clear()
    +{TCCR1B}+ = (1 << +{WGM12}+)      // stop the counter, select CTC mode
  }

  public host setHandlerOnHost(HandlerProtocol.handler h) {    
    clientHandler = h
    // TimerInterrupt.setHandlerOnHost(clientHandler)
  }

  public setHandler(HandlerProtocol.handler h) {
    clientHandler = h
    TimerInterrupt.setHandler(clientHandler)
  }

  public start() {
    // set ticksPerMs, High byte must be written before low byte
    +{OCR1AH}+ = (ticksPerMs >> 8)
    +{OCR1AL}+ = ticksPerMs

    TimerInterrupt.enable()  

    // reset the counter value, start the counter with no prescaler
    +{TCNT1}+ = 0                     
    +{TCCR1B}+ |= (1 << +{CS10}+)
  }
  
  public stop() {
    +{TCCR1B}+ &= ~(1 << +{CS10}+)
    TimerInterrupt.clear()
    TimerInterrupt.disable()
  }
  
  public bool isRunning() {
    return (+{TCCR1B}+ & 0x03) > 0
  }

}

