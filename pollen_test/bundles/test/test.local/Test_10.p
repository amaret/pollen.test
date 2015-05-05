
from pollen.event import Event 
from pollen.event import EventQueue
from virtual.mcu import ConsolePrint as Console


module Test_10 {
  
  const uint8 NumEvents = 5
  host new EventQueue eventQ(NumEvents)

  // this declares an array of event objects  // bug here, they can't be on different lines! 
  host Event events[NumEvents] = { new Event(tick1), new Event(tick2), new Event(tick3), new Event(tick4), new Event(tick5) }

  pollen.run() {

    for (uint8 i = 0; i < NumEvents; ++i) {
      eventQ.add(events[i])
    }

    Event e = null

    for (i = 0; i < NumEvents; ++i) {
      e = eventQ.remove()

      //e = events[i] 
      e.fire()
    }

    // while (!eventQ.isEmpty()) {      
      
    //   e = eventQ.remove()

    //   if (e != null) {
    //     e.fire()
    //   }
    // }

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
