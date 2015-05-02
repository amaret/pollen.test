
//import Dispatcher

import EventProtocol as EP

class Event {

  +{ #include <stdio.h> }+

  EP.handler() eventHandler

  public host Event(EP.handler h) {
    @eventHandler = h
  }

  public Event(EP.handler h) {
    @eventHandler = h
  }

  public host setHandlerOnHost(EP.handler h) {
    eventHandler = h
  }

  public setHandler(EP.handler h) {
    eventHandler = h
  }

//  public post() {    
//    Dispatcher.post(@)                // post event to dispatcher
//  }

//  public postFromInterrupt() {
//    Dispatcher.postFromInterrupt(@)   // post event from interrupt context
//  }

  public fire() {
    if (eventHandler != null) {
      eventHandler()
    }

    +{printf("event fire!\n")}+
  }

}
