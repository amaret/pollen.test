import pollen.environment as Bijou
from Bijou import Led0
from silabs.efm32 import MillisecTimer1 as Timer

module TimerTest4 {
  
  host uint8 countMAX = 50      // milliseconds
  uint8 count = 0

  host TimerTest4() {
    Timer.setHandlerOnHost(msHandler)
  }

  TimerTest4() {
    Led0.makeOutput()
  }

  msHandler() {
    if (count++ == countMAX) {
      Led0.toggle()
      count = 0
    }
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {

    Timer.start()

    while(true) {

    }
  }

}