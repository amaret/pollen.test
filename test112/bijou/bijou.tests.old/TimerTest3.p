
from bijou.boards import BijouTest as Bijou
from Bijou import PC10 as Led

from silabs.efm32 import MicrosecTimer0 as TimerUs

module TimerTest3 {
  
  uint32 counter = 0
  host uint16 duration = 78       // in microseconds

  host TimerTest3() {
    TimerUs.configureOnHost(duration, handler, true)    // 78us timer, repeating
  }

  TimerTest3() {
    Led.makeOutput()
    Led.set()   
  } 

  pollen.reset() {
    Bijou.reset()
  }

  handler() {

    if (++counter == 10) { 
      Led.toggle()    
      counter = 0
    }
  }

  pollen.run() {

    TimerUs.start()

    while(true) {
      +{ EMU_EnterEM1(); }+
    }

  }

}