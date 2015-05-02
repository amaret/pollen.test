
from pollen.hardware import PinProtocol

meta {bool activeLow = false}

module LedMeta {
  
  PinProtocol pin        // protocol member for the pin.

  public LedMeta() {
    off()
    pin.makeOutput()
  }

  public on() {
    provided (activeLow == true) {
      pin.clear()
    } else {
      pin.set()
    }
  }

  public off() {
    provided (activeLow == true) {
      pin.set()
    } else {
      pin.clear()
    }
  }

  public toggle() {
    if (isOn()) {
      off()
    } else {
      on()
    }
  }

  public bool isOn() {
    provided(activeLow == true) {
      return pin.get() == false
    } else {
      return pin.get() == true
    }
  }

}