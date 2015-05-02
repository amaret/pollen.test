import Event
import Dispatcher
import HandlerProtocol as HP 


module EventSystem {
  
  host uint8 NumEvents = 0
  host Event events[NumEvents]

  host EventSystem() {

  }

  EventSystem() { }


  host Event createEventOnHost(HP.handler h) {
    events[NumEvents++] = new Event(h)
    print "Creating new event..\n"
    return events[NumEvents-1]
  }

}