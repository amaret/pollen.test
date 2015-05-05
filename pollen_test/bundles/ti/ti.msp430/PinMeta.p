
from pollen.hardware import PinProtocol

meta { string port, uint8 pin }

module PinMeta implements PinProtocol {
  
  host uint8 pinMask

  host PinMeta() {
    pinMask = (1 << pin)  
  }

  public set() {
    +{ `port`OUT |= `pinMask` }+
  }

  public clear() {
    +{ `port`OUT &= ~`pinMask` }+
  }

  public toggle() {
    +{ `port`OUT ^= `pinMask` }+
  }

  public bool get() {
    return +{ (`port`IN & `pinMask`) }+ ? true : false 
  }

  public bool isInput() {
    return +{ `port`DIR & `pinMask` }+ ? false : true
  }

  public bool isOutput() {
    return +{ `port`DIR & `pinMask` }+ ? true : false
  }

  public makeInput() {
    +{ `port`DIR &= ~`pinMask` }+
  }

  public makeOutput() {
    +{ `port`DIR |= `pinMask` }+
  }

}
