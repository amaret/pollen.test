package pollen.events

----

Event

----

import EventHandler{} as EH

meta{type T = uint8} class Event {

  uint8 priority = 0
  EH.handle handler = null 
  T data = 0

  public Event(EH.handle handler = null, T data = 0, uint8 priority = 0) {
     @handler = handler; @data = data; @priority = priority
  }

  public uint8 getPriority() { return priority }
  public setPriority(uint8 priority) { @priority = priority }

  public EH.handle getHandler() { return @handler }
  public setHandler(EH.handle handler) { @handler = handler }

  public T getData() { return data }
  public setData(T data) { @data = data }

  public handle() {
  	if (handler != null) {	  	
     	handler(@)
     }
  }

}
