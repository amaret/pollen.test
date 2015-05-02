import pollen.environment as Env
from Env import PA0

import USBEvents
import Descriptors

module Test_1 {
  
  Test_1() {
    PA0.clear()
    PA0.makeOutput()
  }

  pollen.run() {

    while(true) {
      PA0.toggle()

      for(uint8 i = 0; i < 10; ++i) {
        Env.wait(1000)
      }
    }
  }

}