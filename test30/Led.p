#package basic

import Pin

module Led {

  Pin pin

  Led() {
    pin.clear()
    pin.makeOutput()
  }

  public on() {
    pin.set()
  }
  
  public off() {
    pin.clear()
  }
  
  public toggle() {
    pin.toggle()
  }
    
}
