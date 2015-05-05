import pollen.environment as Env
from Env import StatusLed as Led
from pollen.time import Timer


module Blink {
  
  host Timer t1 = new Timer(tick)

  Blink() {
    Led.off()
  }

  tick() {
    Led.toggle()
  }

  pollen.run() {
    t1.start(500, true)     // trigger timer periodically every 500ms
    Env.Newsroom.run()      // start the event system
  }

}
