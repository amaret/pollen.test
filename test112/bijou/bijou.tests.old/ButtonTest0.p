import pollen.environment as Bijou

from Bijou import Led0
from Bijou import ButtonPin

from pollen.time import Timer

module ButtonTest0 {

  host Timer dbTimer = new Timer(debounce)
  uint8 debounceTime = 10
  
  ButtonTest0() {
    ButtonPin.clear()
    ButtonPin.makeInput()
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {

    while(true) {
      if (ButtonPin.get()) {
        Led0.off()
      } else {
        dbTimer.start(debounceTime, false)
z                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           }
    }
  }

  debounce() {
    Led0.toggle()
  }
}