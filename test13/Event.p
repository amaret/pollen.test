import Y
import EventHandler as EH 
meta{bool X = true}
class Event {
  uint8 code = 0
  EH.handle(Event) handler 
  //EH.handle handler = null 
  public Event(EH.handle handler = null, uint8 code = 0) {
     @handler = handler; @code = code
  }
  public handle(Event e) {
        if (handler != null) {
          handler(@) // '@' for 'this'
     }
  }
  public Event get( uint8 ii) {
    uint8 jj
    bool flag = X
    return (@)
  }
}
