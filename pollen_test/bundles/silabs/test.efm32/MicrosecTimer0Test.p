import pollen.environment as Env 
from Env import Led0

from silabs.efm32 import EFM32G890 as Mcu
from Mcu import MicrosecTimer0 as Timer

module MicrosecTimer0Test {
  
  host MicrosecTimer0Test() {
    Timer.configureOnHost(8, trigger, false)
  }

  pollen.reset() {
    Mcu.reset()
  }

  pollen.run() {

    Timer.start()

    while(true) {

    }
  }

  trigger() {
    Led0.off()
  }

}