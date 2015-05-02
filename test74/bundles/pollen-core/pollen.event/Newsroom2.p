
import HandlerProtocol as HP

module Newsroom2 { 

  class Event {
    HP.handler() handler
    Event next

    public host Event(HP.handler h) {
      @handler = h
      registerEventOnHost()
    }

    public Event(HP.handler h) {
      @handler = h
    }

  }





}