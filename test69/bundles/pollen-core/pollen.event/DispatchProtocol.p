import Event

protocol DispatchProtocol {
  
  post(Event e)
  postFromInterrupt(Event e)
}