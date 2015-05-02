package pollen.hardware

import HandlerProtocol

protocol TimerMilliProtocol {

  host setHandlerOnHost(HandlerProtocol.handler h)
  setHandler(HandlerProtocol.handler h)
  start()
  stop()
  bool isRunning()

}
