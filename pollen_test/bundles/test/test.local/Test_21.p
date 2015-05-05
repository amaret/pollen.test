import pollen.environment as Env 
from Env import Print

from pollen.time import Timer

module Test_21 {
  
  host Timer t1 = new Timer(tick1)
  host Timer t2 = new Timer(tick2)
  host Timer t3 = new Timer(tick3)

  tick1() { print "TICK1!\n" }

  tick2() { print "TICK2!\n" }

  tick3() { print "TICK3!\n" }

  pollen.run() {

    t1.start(250, true)
    t2.start(350, true)
    t3.start(550, true)

    print "Running!...\n"

    Env.Newsroom.run()  // start the event system
  }

  pollen.shutdown() {
    print "Shutdown!\n" // should never get here because of event system.
  }

}