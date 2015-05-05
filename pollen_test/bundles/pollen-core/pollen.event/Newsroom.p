
from pollen.hardware import GlobalInterruptsProtocol

import Event
import EventQueue

module Newsroom {
  
  host new EventQueue events(0)
  GlobalInterruptsProtocol GI         // protocol member for global interrupts

  host Newsroom() {
  }

  Newsroom() {}

  public host registerEventOnHost() {    
    events.setCapacityOnHost(events.getCapacityOnHost() + 1) 
    print "Newsroom: event registered. Event capacity = " + events.getCapacityOnHost() + "\n"    
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
    volatile bool loop = true

    GI.enable()

    while(loop) {
      GI.disable()           // disable global interrupts
      dispatch()             // dispatch the event
      GI.enable()            // reenable global interrupts
      //pollen.hibernate(1)    // go into IDLE mode.
    }

  } 

  /////////////////////////////////////////////////////////
  // Private methods 
  /////////////////////////////////////////////////////////

  dispatch() {
    Event e = null 
    e = events.remove()

    while (e != null) {
      GI.enable()
      e.fire()
      e = events.remove()
    }
  }


}