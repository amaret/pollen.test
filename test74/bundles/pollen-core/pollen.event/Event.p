
import HandlerProtocol as HP
import Newsroom

class Event {

  uint16 data = 0xBEEF
  HP.handler() eventHandler = null

  //public host Event() {
  //  print "in host constructor with NO parm\n"
  //  @eventHandler = null
  //}

   public host Event(HP.handler h) {
     @eventHandler = h
     print "host new Event handler = " + @eventHandler + "\n"
     Newsroom.registerEventOnHost()
   }

  //host public Event(HP.handler h) {
  //  print "in host constructor with parm\n"
  //  @eventHandler = h
  //}

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
    +{ printf("Event 0x%x posting handler=0x%x\n", this, this->eventHandler)}+
    Newsroom.post(@)
  }

  public postFromInterrupt() {
    Newsroom.postFromInterrupt(@)
  }

  public fire() {
    +{ printf("Event 0x%x firing handler=0x%x\n", this, this->eventHandler)}+

    if (@eventHandler != null) {
      eventHandler()
    }
  }

}
