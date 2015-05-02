package pollen.hardware

import Pin

meta {bool activeLow = false}

module MetaLed {

  Pin pin

  MetaLed() {
    off()
  }

  public on() { 
    provided(activeLow == true) {
      pin.clear()
    } else {
      pin.set()
    }
  }
  
  public off() { 
    provided(activeLow == true) {
      pin.set()
    } else {
      pin.clear()
    }
  }
  
  public toggle() { 
    pin.toggle()
  }
  
  public bool isOn() { 
    provided(activeLow == true) {
      return pin.get() == false
    } else {
      return pin.get()
    }    
  }
}