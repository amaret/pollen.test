import EventHandler{uint8} as EH 
meta{type T=uint8}
class Event {
  T code = 0
  (T EH.handler()) eventHandler = null

  public host Event(EH.handler h) {
    @eventHandler = h
  }

  public handle() {
        if (eventHandler != null) {
          eventHandler() 
     }
  }
}

