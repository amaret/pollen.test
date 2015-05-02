
from pollen.hardware import GlobalInterruptsProtocol
from pollen.hardware import HandlerProtocol as HP
from pollen.data import Queue {HP.handler} as HandlerQueue

module Dispatcher {
  
  host new HandlerQueue eventHandlers(10)
  GlobalInterruptsProtocol GI         // protocol member for global interrupts

  host Dispatcher() {}

  Dispatcher() {}

  public post(HP.handler h) {
    GI.disable()
    eventHandlers.add(h) 
    GI.enable()
  }

  public postFromInterrupt(HP.handler h) {
    eventHandlers.add(h) 
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

  dispatch() {
    HP.handler() h 
    h = eventHandlers.remove()

    while (h != null) {
      GI.enable()
      h()
      h = eventHandlers.remove()
    }
  }

}
