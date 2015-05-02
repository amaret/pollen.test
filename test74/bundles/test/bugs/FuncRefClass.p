from pollen.hardware import HandlerProtocol as HP

class FuncRefClass {
  
  host HP.handler() myHandler

  public host FuncRefClass(HP.handler h) {
    myHandler = h
  }

  public host setHandlerOnHost(HP.handler h) {
    myHandler = h
  }

  public test() {
    myHandler()
  }
}