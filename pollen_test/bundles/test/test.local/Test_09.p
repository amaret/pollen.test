from pollen.event import Event 
from pollen.data import HandlerQueue
from virtual.mcu import ConsolePrint as Console


module Test_09 {
  
  // this declares 
  //Event events[5] = {null}
  const uint8 NumEvents = 2

  // this declares an array of event objects 
  host Event events[NumEvents] = { new Event(tick1), new Event(tick2) }

  pollen.run() {
    Event e = null

    for (uint8 i = 0; i < NumEvents; ++i) {
      e = events[i]
      e.fire()
    }
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
