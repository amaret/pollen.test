import EventHandler{} as EH 
meta{type T}
class Event {
  uint8 code = 0
// TEST declare a function reference incorrectly (no parameter type list)
  EH.handle() handler  //= null
  EH.handle handler2  = 0
// TEST declare a typed member incorrectly - init to 0
  public Event(EH.handle handler = null, uint8 code = 0) {
     @handler = handler; @code = code
  }
  public handle() {
        if (handler != null) {
          handler(@) // '@' for 'this'
     }
  }
  public T get( T ii) {
    T jj
    return jj
  }
}
