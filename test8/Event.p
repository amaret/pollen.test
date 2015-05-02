import EventHandler{uint8} as EH 
#import EventHandler as EH 
#meta{type T = uint8}
meta{type T}
class Event {
  uint8 code = 0
  //EH.handle handler = null
  EH.handle(Event) handler 

  public Event(EH.handle handler = null, uint8 code = 0) {
     @handler = handler; @code = code
  }
  public handle(T p) {
     string n = pollen.unitname
        if (handler != null) {
          handler(p) // '@' for 'this'
     }
  }
  public uint8 getCode() {
    if (code == 0) {
      return code
    }
    else {
      return 1
    }
  }
  public T get( T ii) {
    T jj
    return jj
  }
}
