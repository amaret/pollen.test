package silabs.efm32

from pollen.hardware import PinProtocol

meta { string port, uint8 pin }

module PinMeta implements PinProtocol {

  +{ 
      #ifndef __PinMeta_P__
      #define __PinMeta_P__
        #include "em_gpio.c"
      #endif
  }+
  
  host uint8 portNum      
  bool _input = false

  host PinMeta() {
    if   (port == "A") { portNum = 0 }
    elif (port == "B") { portNum = 1 }
    elif (port == "C") { portNum = 2 }
    elif (port == "D") { portNum = 3 }
    elif (port == "E") { portNum = 4 }
    elif (port == "F") { portNum = 5 }
  }

  PinMeta() {

    // This really should only be done once for all pins! Manager Pattern!
    +{ CMU_ClockEnable(cmuClock_HFPER, true) }+
    +{ CMU_ClockEnable(cmuClock_GPIO, true) }+
    clear()
  }

  public set() { 
    +{ GPIO_PinOutSet(`portNum`, `pin`) }+
  } 

  public clear() {
    +{ GPIO_PinOutClear(`portNum`, `pin`) }+
  } 
  
  public toggle() {
    +{ GPIO_PinOutToggle(`portNum`, `pin`) }+
  }  
  
  public bool get() {
    if (_input) {
      return +{ GPIO_PinInGet(`portNum`, `pin`) }+ == 1      
    } else {  
      return +{ GPIO_PinOutGet(`portNum`, `pin`) }+ == 1
    }
  }

  public bool isInput() {
    return _input == true
  }
  
  public bool isOutput() {
    return _input == false
  }
  
  public makeInput() {
    _input = true
    +{ GPIO_PinModeSet(`portNum`, `pin`, gpioModeInput, 0) }+
  } 
  
  public makeOutput() {
    _input = false
    +{ GPIO_PinModeSet(`portNum`, `pin`, gpioModePushPull, 0) }+
  } 
  
}