!-----------------------------------------------------------------------------
  Meta-device driver for general purpose input/output pins on the local host.
  Pins just print their state out.
------------------------------------------------------------------------------!

package virtual.mcu

from pollen.hardware import PinProtocol

meta {string pname, uint8 pnum}

module PinMeta implements PinProtocol {
  
  PinMeta() {
    name = pname
    num = pnum
    input = false
    state = false
  }

  public set() { 
    +{ printf("Pin:set\n") }+
  } 

  public clear() { 
    +{ printf("Pin.clear\n") }+
  }

  public toggle() { 
    +{ printf("Pin.toggle\n") }+
  }

  public bool get() { 
    +{ printf("Pin.get\n") }+
    return true
  }

  public makeInput() { 
    +{ printf("Pin.makeInput\n") }+
  }

  public bool isInput() { 
    +{ printf("Pin.isInput\n") }+
    return true
  }

  public makeOutput() { 
    +{ printf("Pin.makeOutput\n") }+
  }

  public bool isOutput() { 
    +{ printf("Pin.isOutput\n") }+    
    return true
  }
  
  !-------------------------------------------------------------------------
  Private data members - this is a virtualized pin so we keep its state
  --------------------------------------------------------------------------!
  string name 
  uint8 num
  bool state
  bool input


}