
from pollen.hardware import GlobalInterruptsProtocol
import Event
import EventQueue
import DispatchProtocol

module Dispatcher implements DispatchProtocol {
  
  host uint8 capacity = 0
  host EventQueue events
  GlobalInterruptsProtocol GI         // protocol member for global interrupts

  host Dispatcher() {
    events = new EventQueue(capacity)
    print "Dispatcher creating event queue with capacity: " + capacity + "\n"
  }

  Dispatcher() {}

  public host registerEventOnHost() {    
    events.setCapacityOnHost(++capacity)      
    print "Event registered. Capacity=" + capacity + "\n"
  }

  public post(Event e) {
   +{printf("Event posted..")}+
    GI.disable()
    events.add(e) 
    GI.enable()
  }

  public postFromInterrupt(Event e) {
    events.add(e) 
  }

  public run() {

    GI.enable()

    while(true) {
      GI.disable()           // disable global interrupts
      dispatch()             // dispatch the event
      GI.enable()            // reenable global interrupts
      break;
      // pollen.hibernate(1) // go into IDLE mode.
    }
  } 

  dispatch() {
    Event e = null 
    e = events.remove()

    while (e != null) {
      +{printf("Dispatching..")}+
      GI.enable()
      e.fire()
      e = events.remove()
    }
  }

}
