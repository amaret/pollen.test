
import pollen.environment as Env
from Env import Led

module Blink {
  
  pollen.run() {

    while(true) {
      Led.toggle()
      Env.wait(5000)
    }
  }
}