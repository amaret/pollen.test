
from pollen.hardware import HandlerProtocol as HP
from pollen.hardware import EdgeTriggeredInputProtocol as EdgeInput
from pollen.time import Timer
from pollen.event import Event

meta {bool activeLow = false}

module ButtonMeta {
  
  EdgeInput edgeInput        // protocol member for the pin.

  host new Timer dbTimer(debounce)
  host uint8 pressDebounce = 10         // milliseconds
  host Event onPress = new Event(null)


  host ButtonMeta() {
    edgeInput.setDetectFallingEdgeOnHost(true)
    edgeInput.setHandlerOnHost(pressHandler)
  }
 
  ButtonMeta() {
    edgeInput.enableDetect()
  }

  public host setOnPressOnHost(HP.handler h) { 
    onPress.setHandlerOnHost(h)
  }

  public setOnPress(HP.handler h) { 
    onPress.setHandler(h); 
  }

  public bool isPressed() {
    provided (activeLow == true) {
      return edgeInput.get() == false
    } else {
      return edgeInput.get() == true
    }
  }

  //////////////////////////////
  // Private functions
  //////////////////////

  pressHandler() {
        onPress.post()                          // post the event...      
    if (isPressed()) {   
      dbTimer.oneshot(pressDebounce)  // start debounce timer
    }
  }


  debounce() {
    if (isPressed()) {           // if button still pressed - ACTIVE LOW
      //if (onPress != null) {
        onPress.post()                          // post the event...      
      //}
    }
  }


}