# TEST using POLLEN_TARGET, POLLEN_BUNDLES, cFlags.
# TEST runnable test.
from pollen.event import Dispatcher
from pollen.event import Event 
from virtual.mcu import ConsolePrint as Console
from virtual.mcu import GlobalInterrupts

module Test_11 {

  +{ #include <stdio.h> }+
  
  const uint8 NumEvents = 5
  // this declares an array of event objects  
  host Event events[NumEvents] = { new Event(tick1), new Event(tick2), new Event(tick3), new Event(tick4), new Event(tick5) }

  host Test_11() {
    Dispatcher.GI := GlobalInterrupts
  }

  pollen.run() {
    Event e = null

    for (uint8 i = 0; i < NumEvents; ++i) {
      print "in loop to post events\n"
      e = events[i]
      Dispatcher.post(e)    // post the event
    }

    Dispatcher.run()
  }

  pollen.shutdown(uint8 id) {
    Console.printStr("Shutdown\n")
  }

  tick1() {
    print "TICK 1\n"    
  }

  tick2() {
    print "TICK 2\n"    
  }

  tick3() {
    print "TICK 3\n"    
  }

  tick4() {
    print "TICK 4\n"    
  }

  tick5() {
    print "TICK 5\n"    
  }

}
