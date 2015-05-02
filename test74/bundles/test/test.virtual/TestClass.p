
from pollen.event import HandlerProtocol as HP
from pollen.event import Event

class TestClass {
  
  host Event e

  public host TestClass(HP.handler h) {
    e = new Event(h)
  }

  public test() {
    e.fire()
  }
  
}