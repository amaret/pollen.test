
----

Event

----

import EventHandler{} as EH

meta{type T = uint8} class Event {

  uint8 priority = 0
  EH.handle(T) handler // note that EH 'handle()' takes the same meta type parm as Event
  T data = 0

 //public host Event(EH.handle handler = null, T data = 0, uint8 priority = 0) {
 //   @handler = handler; @data = data; @priority = priority
 // }
  public host Event() {}

  public uint8 getPriority() { 
        return priority 
  }
  public setPriority(uint8 priority) { 
        @priority = priority 
  }

  public EH.handle getHandler() { 
        return @handler 
  }
  public setHandler(EH.handle handler) { 
        @handler = handler 
  }
  public T getData() { 
        return data 
  }
  public setData(T data) { 
        @data = data 
  }

  public handle(T data) {
        if (handler != null) {	  	
     	        handler(data)
        }
  }

}
