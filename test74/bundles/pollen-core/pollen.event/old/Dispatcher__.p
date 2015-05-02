
from pollen.hardware import GlobalInterruptsProtocol
from pollen.event import EventHub as Hub

module Dispatcher {
  
  GlobalInterruptsProtocol GI         // protocol member for global interrupts

  host Dispatcher() {}

  Dispatcher() {}

  public run() {

    GI.enable()

    while(true) {
      GI.disable()           // disable global interrupts
      dispatch()             // dispatch the event
      GI.enable()            // reenable global interrupts
      // pollen.hibernate(1) // go into IDLE mode.
    }
  } 

  dispatch() {

    while (Hub.hasEvents()) {
      Hub.fireNext()
    }

    while (e != null) {
      +{printf("Dispatching..")}+
      GI.enable()
      e.fire()
      e = events.remove()
    }
  }

}
