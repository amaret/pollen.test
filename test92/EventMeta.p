import EventHandler{Payload} as EH    // is this desirable? EventHandler is instantiated with a type parameter specified in the meta type decl below.

meta{type Payload=uint8}              // same 'Payload' type parameter for payload for import and meta dcln
class EventMeta {

  EH.handler(Payload) eventHandler = null

  public host EventMeta(EH.handler h) {
    @eventHandler = h
  }

  public handle(Payload t) {
        if (eventHandler != null) {
          eventHandler(t) 
     }
  }
}

