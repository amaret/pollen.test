
from pollen.event import Dispatcher
from pollen.event import Event 
from virtual.mcu import ConsolePrint as Console
from virtual.mcu import GlobalInterrupts

module Test_11 {
  
  const uint8 NumEvents = 5
  // this declares an array of event objects  // bug here, they can't be on different lines! 
  host Event events[NumEvents] = { new Event(tick1), new Event(tick2), new Event(tick3), new Event(tick4), new Event(tick5) }

  host Test_11() {
    Dispatcher.GI := GlobalInterrupts
  }

  pollen.run() {
    Event e = null

    for (uint8 i = 0; i < NumEvents; ++i) {
      e = events[i]
      Dispatcher.post(e)    // post the event
    }

    Dispatcher.run()
  }

  pollen.shutdown() {
    Console.printStr("Shutdown\n")
  }

  tick1() {
    Console.printStr("Tick1\n")
  }

  tick2() {
    Console.printStr("Tick2\n")    
  }

  tick3() {
    Console.printStr("Tick3\n")    
  }

  tick4() {
    Console.printStr("Tick4\n")    
  }

  tick5() {
    Console.printStr("Tick5\n")    
  }

}
