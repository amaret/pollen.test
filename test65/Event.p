//import EventHandler{meta[0]} as EH 
import EventHandler{uint8} as EH 
meta{type T, type D}
class Event {
  D code = 0
  EH.handle(T) handler  
  public Event(EH.handle handler = null, D code = 0) {
     @handler = handler; @code = code
  }
  public handle() {
        if (handler != null) {
          handler(code) 
     }
  }
}
