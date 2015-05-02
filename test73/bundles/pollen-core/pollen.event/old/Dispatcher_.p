
from pollen.hardware import GlobalInterruptsProtocol
import Event
import EventQueue
import DispatchProtocol

module Dispatcher implements DispatchProtocol {
  
  host uint8 capacity = 5  
  host new EventQueue events(capacity)
  GlobalInterruptsProtocol GI         // protocol member for global interrupts

  host Dispatcher() {}

  Dispatcher() {}

  public host registerEvent() {    
    events.setCapacityOnHost(++capacity)
    print "Event registered. Capacity=" + capacity 
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
