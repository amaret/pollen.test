
import HandlerProtocol as HP
import Newsroom

class Event {

  HP.handler() eventHandler = null

  public host Event(HP.handler h) {
    @eventHandler = h
    Newsroom.registerEventOnHost()
  }

  public Event(HP.handler h) {
    @eventHandler = h
  }

  public host setHandlerOnHost(HP.handler h) {
    @eventHandler = h
    Newsroom.registerEventOnHost()
  }

  public setHandler(HP.handler h) {
    @eventHandler = h
  }

  public HP.handler getHandler() {
    return @eventHandler
  }

  public post() {
    if (@eventHandler != null) {
      Newsroom.post(@)
    }
  }

  public postFromInterrupt() {
    Newsroom.postFromInterrupt(@)
  }

  public fire() {
    if (@eventHandler != null) {
      eventHandler()
    }
  }

}