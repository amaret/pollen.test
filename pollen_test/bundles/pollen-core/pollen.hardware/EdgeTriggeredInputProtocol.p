from pollen.hardware import HandlerProtocol as Handler
from pollen.event import Event

protocol EdgeTriggeredInputProtocol {

    // Enable detection of GPIO edge changes
    enableDetect()
    
    // Disable detection of GPIO edge changes
    disableDetect()   
    
    // Clear any current detection of edge change
    clearDetect()
    
    // Get the state of the input
    bool get()

    // Set pin to detect low-to-high transitions i.e. rising edges
    setDetectRisingEdge(bool val)    
    host setDetectRisingEdgeOnHost(bool val)

    // Set pin to detect high-to-low transitions i.e. falling edges
    setDetectFallingEdge(bool val)
    host setDetectFallingEdgeOnHost(bool val)

    // Host to set a handler to be called at interrupt context instead
    // of having an event posted. This functionality is for low-level drivers 
    // that require it. Most applications should use events and setDetectEvent 
    host setHandlerOnHost( Handler.handler h )

}