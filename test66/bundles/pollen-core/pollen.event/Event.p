
import Dispatcher

from pollen.hardware import HandlerProtocol as HP

class Event {

  HP.handler() eventHandler

  public host Event(HP.handler h) {
    @eventHandler = h
  }

  public Event(HP.handler h) {
    @eventHandler = h
  }

  public host setHandlerOnHost(HP.handler h) {
    eventHandler = h
  }

  public setHandler(HP.handler h) {
    eventHandler = h
  }

  public post() {    
    Dispatcher.post(@fire)                // post event to dispatcher
  }

  public postFromInterrupt() {
    Dispatcher.postFromInterrupt(@fire)   // post event from interrupt context
  }

  public fire() {
    if (eventHandler != null) {
      eventHandler()
    }
  }

}