#import EventHandler{uint32} as EH 
import EventHandler{} as EH 
meta{type T}
class Event {
  T code = 0
  EH.handle(Event) handler
  public Event(EH.handle handler = null, uint8 code = 0) {
     @handler = handler; @code = code
  }
  public handle() {
        if (handler != null) {
          //handler(@) // '@' for 'this'
     }
  }
  public T get( T ii) {
    T jj
    return jj
  }
}
