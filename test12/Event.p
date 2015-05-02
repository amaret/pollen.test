// TEST importing meta type with no argument when it has no default value formal parameter 
import EventHandler as EH 
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
