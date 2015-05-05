import pollen.environment as Env
from Env import StatusLed as Led1
from Env import Led2
from Env import Led3

from pollen.time import Timer

module Blink {
  
  host Timer t1 = new Timer(tick1)
  host Timer t2 = new Timer(tick2)
  host Timer t3 = new Timer(tick3)

  Blink() {
    Led1.off()
    Led2.off()
    Led3.off()
  }

  tick1() {
    Led1.toggle()
  }

  tick2() {
    Led2.toggle()
  }

  tick3() {
    Led3.toggle()
  }  

  pollen.run() {
    t1.start(500, true)     // trigger timer periodically every 500ms
    t1.start(247, true)     // trigger timer periodically every 247ms
    t1.start(139, true)     // trigger timer periodically every 139ms

    Env.Newsroom.run()      // start the event system
  }

}
