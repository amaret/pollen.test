from pollen.hardware import HandlerProtocol as Handler
from pollen.hardware import EdgeTriggeredInputProtocol

import PinMeta{"B", 10} as PB10

module EdgeTriggeredInputPB10 implements EdgeTriggeredInputProtocol {
    
  host bool detectRising = false
  host bool detectFalling = false
  host Handler.handler() edgeHandler = null

  EdgeTriggeredInputPB10() {
    PB10.clear()
    PB10.makeInput()
  }

  // Enable detection of GPIO edge changes
  public enableDetect() {
    +{
      GPIO_IntConfig(1,  10, `detectRising`, `detectFalling`, true); 
      NVIC_ClearPendingIRQ(GPIO_EVEN_IRQn);
      NVIC_EnableIRQ(GPIO_EVEN_IRQn);
    }+
  }
    
  // Disable detection of GPIO edge changes
  public disableDetect() {
    +{
      GPIO_IntConfig(1,  10, false, false, false); 
      NVIC_DisableIRQ(GPIO_EVEN_IRQn);
      NVIC_ClearPendingIRQ(GPIO_EVEN_IRQn);
    }+
  }
    
  // Clear any current detection of edge change
  public clearDetect() {
    uint32 flags = (1 << 10) 
    +{
      GPIO_IntClear(`flags`);
      NVIC_ClearPendingIRQ(GPIO_EVEN_IRQn);
    }+
  }
  
  public bool get() {
    return PB10.get()
  }

  // Set pin to detect low-to-high transitions i.e. rising edges
  public setDetectRisingEdge(bool val) {
    detectRising = val
  }

  public host setDetectRisingEdgeOnHost(bool val) {
    detectRising = val
  }

  // Set pin to detect high-to-low transitions i.e. falling edges
  public setDetectFallingEdge(bool val) {
    detectFalling = val
  }

  public host setDetectFallingEdgeOnHost(bool val) {
    detectFalling = val
  }

  // Host to set a handler to be called at interrupt context instead
  // of having an event posted. This functionality is for low-level drivers 
  // that require it. Most applications should use events and setDetectEvent 
  public host setHandlerOnHost( Handler.handler h ) {
    edgeHandler = h
  }

  +{
    void GPIO_EVEN_IRQHandler(void) {
      uint32 iflags;
      iflags = GPIO_IntGetEnabled() & 0x00005555;     // Get all even interrupts.
      GPIO_IntClear(iflags);                        // Clean only even interrupts.
      `edgeHandler`();
    }
  }+


}