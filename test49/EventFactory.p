import Event{} //Event{T}
import EventHandler{} as EH //EventHandler{T} as EH
meta{type T}
module EventFactory {
  host Event e = null
  public host Event create(EH.handle handler, T code) {
     e = Event.create(handler, code)
     return e
  }
}

