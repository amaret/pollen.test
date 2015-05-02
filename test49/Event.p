import EventHandler{uint8} as EH 
//import EventHandler{T} as EH 
meta{type T=uint8}
class Event {
  T code = 0
  EH.handle(Event) handler 
  public host Event() {
    code = 3
  }
  public host Event create(EH.handle handler, T code) {
     @handler = handler; @code = code
     return @
  }
  public Event() {
    code = 7
  }
  public handle() {
        if (handler != null) {
          handler(code) // '@' for 'this'
     }
  }
}

