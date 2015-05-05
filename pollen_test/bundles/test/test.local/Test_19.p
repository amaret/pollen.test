import pollen.environment as Env 
from pollen.time import Timer

module Test_19 {
  
  host Timer t1 = new Timer(tick)

  tick() {
    print "TICK!\n"
  }

  pollen.run() {
    t1.start(500, true)       // fire repeatedly every 500ms
    Env.Newsroom.run()        // start the event system
  }

  pollen.shutdown() {
    print "Shutdown!\n"       // shouldn't get here because of event loop
  }

}