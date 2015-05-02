!-----------------------------------------------------------------------------
  Meta-device driver for general purpose input/output pins on the local host.
  Pins just print their state out.
------------------------------------------------------------------------------!

package amaret.local

from pollen.hardware import Pin

meta {string name, uint8 num}

module MetaPin implements Pin {

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
	
}