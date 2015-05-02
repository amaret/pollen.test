
from atmel.atmega import ATmega328 as Mcu
from Mcu import TimerMilliTC1
from Mcu import GlobalInterrupts
from Mcu import PB5

from pollen.time import Timer

module Test_03 {
  
  host Test_03() {
    Mcu.setFrequencyOnHost(16000000)
    Timer.hwTimer := TimerMilliTC1
  }

  Test_03() {
    PB5.makeOutput()

  }

  pollen.run() {

    Timer.start(tick, 100, true)
    GlobalInterrupts.enable()

    while(true) {

    }
  }

  tick() {
      PB5.toggle()  
  }
}