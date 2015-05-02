
import HandlerProtocol as HP
import Newsroom

class Event {

  HP.handler() eventHandler

  public host Event(HP.handler h) {
    @eventHandler = h
    Newsroom.registerEventOnHost()
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
    Newsroom.post(@)
  }

  public postFromInterrupt() {
    Newsroom.postFromInterrupt(@)
  }

  public fire() {
    if (eventHandler != null) {
      eventHandler()
    }
  }

}