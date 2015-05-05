package local.mcu

!-----------------------------------------------------------------------------
  Meta-device driver for general purpose input/output pins on the local host.
  Pins just print their state out.
------------------------------------------------------------------------------!

from pollen.hardware import PinProtocol

meta {string pname, uint8 pnum}

module PinMeta implements PinProtocol {
  
  PinMeta() {
    name = pname
    num = pnum
    input = false
    state = false
    print "Pin Init: " + pollen.unitname + "\n"
  }

  public set() { 
    state = true
    print pollen.unitname + ".set\n"
  } 

  public clear() { 
    state = false
    print pollen.unitname + ".clear\n"
  }

  public toggle() { 
    state = !state
    print pollen.unitname + ".toggle\n"
  }

  public bool get() { 
    print pollen.unitname + ".get\n"
    return state
  }

  public makeInput() { 
    input = true
    print pollen.unitname + ".makeInput\n"
  }

  public bool isInput() { 
    print pollen.unitname + ".isInput\n"
    return input == true
  }

  public makeOutput() { 
    input = false
    print pollen.unitname + ".makeOutput\n"
  }

  public bool isOutput() { 
    print pollen.unitname + ".isOutput\n"
    return input == false
  }
  
  !-------------------------------------------------------------------------
  Private data members - this is a virtualized pin so we keep its state
  --------------------------------------------------------------------------!
  string name 
  uint8 num
  bool state
  bool input


}