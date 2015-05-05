package pollen.hardware

import HandlerProtocol

protocol HardwareTimerProtocol {
	
  host setHandlerOnHost(HandlerProtocol.handler h)

  setHandler(HandlerProtocol.handler h)

  start()

  stop()

  bool isRunning()

}