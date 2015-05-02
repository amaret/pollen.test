
from pollen.hardware import GlobalInterruptsProtocol
from pollen.event import EventQueue
from pollen.event import Event

module Dispatcher {
  
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

    uint8 count = 0
    uint8 limit = 25

    GI.enable()

    while(true) {
      GI.disable()           // disable global interrupts
      dispatch()             // dispatch the event
      GI.enable()            // reenable global interrupts
      // pollen.hibernate(1) // go into IDLE mode.
      count++
      if (count > limit) {
        break
      }
    }
  } 

  dispatch() {
    Event e = null 
    e = events.remove()
    print "In dispatch()..\n"

    while (e != null) {
      +{printf("Dispatching..")}+
      GI.enable()
      e.fire()
      e = events.remove()
    }
  }

}
