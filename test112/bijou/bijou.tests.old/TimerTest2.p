
from bijou.boards import BijouTest as Bijou
from Bijou import PC10 as Led

from silabs.efm32 import MicrosecTimer0 as TimerUs

module TimerTest2 {
  
  uint32 counter = 0

  host TimerTest2() {
    TimerUs.setHandlerOnHost(handler)
  }

  TimerTest2() {
    Led.makeOutput()
    Led.set()   
  } 

  pollen.reset() {
    Bijou.reset()
  }

  handler() {

    if (++counter == 20) { 
      Led.toggle()    
      counter = 0
    }
  }

  pollen.run() {

    TimerUs.startPeriodic(1000)

    while(true) {
      +{ EMU_EnterEM1(); }+
    }

  }

}