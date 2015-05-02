
import pollen.environment as Environment
from Environment import Led

module Blink_02 {
  
  pollen.run() {

    while(true) {
      Led.toggle()
      Environment.wait(50000)
    }
  }
}