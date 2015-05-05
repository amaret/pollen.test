import pollen.environment as Bijou

from Bijou import Led0
from pollen.time import Timer

module Test0 {

  host Timer t1 = new Timer(toggle)

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    t1.start(250, true)
    Bijou.run()
  }

  toggle() {
    Led0.toggle()
  }  
}