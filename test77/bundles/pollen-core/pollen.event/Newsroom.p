
from pollen.hardware import GlobalInterruptsProtocol

import Event
import EventQueue

module Newsroom {

  +{ #include <stdlib.h> }+        
  
  host new EventQueue events(0)
  GlobalInterruptsProtocol GI         // protocol member for global interrupts


  host Newsroom() {
  }

  Newsroom() {}

  public host registerEventOnHost() {    
    events.setCapacityOnHost(events.getCapacityOnHost() + 1) 
    print "Newsroom event registered. Event capacity = " + events.getCapacityOnHost() + "\n"    
  }

  public post(Event event) {
    GI.disable()
    events.add(event) 
    GI.enable()
  }

  public postFromInterrupt(Event event) {
    events.add(event) 
  }

  public run() {
    GI.enable()


    while(true) {
      GI.disable()           // disable global interrupts
      dispatch()             // dispatch the event
      GI.enable()            // reenable global interrupts
      // pollen.hibernate(1) // go into IDLE mode.
    }
  } 

  /////////////////////////////////////////////////////////
  // Private methods 
  /////////////////////////////////////////////////////////

  uint32 counter = 0

  dispatch() {
    Event e = null 
    e = events.remove()
    while (e != null) {
      GI.enable()
      e.fire()
      counter++
      e = events.remove()
    }

    if (counter > 10) {
       pollen.shutdown(uint8 id)
    }
  }

}
