package pollen.hardware

import HandlerProtocol

protocol InterruptSourceProtocol {

    host setHandlerOnHost(HandlerProtocol.handler h)

    setHandler(HandlerProtocol.handler h)

    enable()

    disable()

    clear()

    bool isEnabled()

}