import pollen.environment as Env 
from pollen.time import Timer

module Test_19 {
  
  host Timer t1 = new Timer(tick)
  uint8 count = 0

  tick() {
    print "TICK!\n"
    if (++count == 10) {
      t1.stop()
    }
  }

  pollen.run() {

    t1.start(500, true)       // fire repeatedly every 500ms
    
    print "Run!\n"

    Env.Newsroom.run()        // start the event system
  }

  pollen.shutdown(uint8 id) {
    print "Shutdown!\n"       // shouldn't get here because of event loop
  }

}
