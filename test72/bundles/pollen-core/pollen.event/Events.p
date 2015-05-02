package pollen.event 

import HandlerProtocol as HP
from virtual.mcu import ConsolePrint as CP 

module Events {
  
  
//  !-------------------------
//    Event class definition
//   -------------------------!

  class Event {
  
    HP.handler() handler

    public host Event (HP.handler h) {
      registerEvent()
      handler = h
    }

    public Event(HP.handler h) {
      handler = h
    }

    public host setHandlerOnHost(HP.handler h) {
      handler = h
    }

    public setHandler(HP.handler h) {
      handler = h
    }
    
  }


//  !-------------------------
//    Events module body
//   -------------------------!

  host uint8 numEvents = 0

  host Events() {
    print "Events Init\n"
  }

  Events() {

  }

  public host registerEvent() {
    ++numEvents
    print "Event Registered: " + numEvents + " \n"

  }

  public test(Event e) {
    CP.printStr("numEvents=")
    CP.printUint(numEvents)

    e.handler()
  }


}
