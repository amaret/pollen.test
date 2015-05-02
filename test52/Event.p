import EventHandler{} as EH 

meta{type T}
class Event {
  uint8 code = 0
  EH.handle(T) handler  //= null

  public Event(EH.handle handler = null, uint8 code = 0) {
     @handler = handler; @code = code
  }
  public handle() {
        if (handler != null) {
          handler(3) 
     }
  }
  public T get( T ii) {
    T jj
    return jj
  }
}
