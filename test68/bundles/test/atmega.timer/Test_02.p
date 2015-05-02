
from atmel.atmega import ATmega328 as Mcu
from Mcu import Timer1MatchAInterrupt
from Mcu import TimerMilliTC1
from Mcu import GlobalInterrupts
from Mcu import PB5

from pollen.hardware import HandlerProtocol
from pollen.hardware import InterruptSourceProtocol

//from pollen.time import Timer

module Test_02 {
  
  uint16 count = 0

  host Test_02() {
    Mcu.setFrequencyOnHost(16000000)
    TimerMilliTC1.TimerInterrupt := Timer1MatchAInterrupt
    TimerMilliTC1.setHandlerOnHost(tick)
    //Timer.hwTimer := TimerMilliTC1
  }

  Test_02() {
    PB5.makeOutput()

  }

  pollen.run() {

    TimerMilliTC1.start()
    GlobalInterrupts.enable()

    while(true) {

    }
  }

  tick() {
    if (++count == 1000) {
      PB5.toggle()  
      count = 0
    }    
  }
}