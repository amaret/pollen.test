import pollen.environment as Env

from Env import Led0
from pollen.time import Timer

from pollen.event import Event

module Test0 {
  
  host Timer tickTimer = new Timer(tick)
  host Timer tickTimer2 = new Timer(tick2)

  pollen.reset() {
    Env.reset()
  }

  pollen.run() {

    print "Start ticks...\n"    
    //tickTimer2.start(250, true)
    tickTimer.start(500, false)
    Env.run()
  }

  tick() {
    print "Tick toggle...\n"
    Led0.toggle()
    tickTimer.start(500, false)    
  }

  tick2() {
    print "Tick2 start...\n"
    tickTimer.start(10, false)
  }

  pollen.shutdown() {

  }
}