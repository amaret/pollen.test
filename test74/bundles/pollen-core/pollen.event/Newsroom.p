
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
    print "Newsroom event registered. Capacity=" + events.getCapacityOnHost() + "\n"    
  }

  // public host registerEvents(uint8 num) {
  //   capacity += num
  //   events.setCapacityOnHost(capacity)      
  //   print "Newsroom event capacity increased to: " + capacity + "\n"
  // }

  public post(Event event) {
   +{printf("\tNewsroom event posted..\n")}+
    GI.disable()
    events.add(event) 
    GI.enable()
  }

  public postFromInterrupt(Event event) {
    events.add(event) 
  }

  public run() {
    uint8 times = 20
    GI.enable()

    while(true) {
      GI.disable()           // disable global interrupts
      dispatch()             // dispatch the event
      GI.enable()            // reenable global interrupts
      //break;
      //if (--times == 0) { break; }
      // pollen.hibernate(1) // go into IDLE mode.
    }
  } 

  /////////////////////////////////////////////////////////
  // Private methods 
  /////////////////////////////////////////////////////////

  dispatch() {
    Event e = null 
    e = events.remove()

    while (e != null) {
      +{printf("\tNewsroom dispatching..\n")}+
      GI.enable()
      +{printf("\tNewsroom about to fire on 0x%x ..\n", `e`)}+
      e.fire()
      +{printf("\tNewsroom after fire..\n")}+
      e = events.remove()
      +{printf("\tNewsroom after remove..\n")}+      
    }
  }


}