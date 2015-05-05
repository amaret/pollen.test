from pollen.hardware import PinProtocol

meta {string port, uint8 pin}

module PinMeta implements PinProtocol {
  
  +{ #include <avr/io.h> }+

  host uint8 pinMask

  host PinMeta() {
    pinMask = (1 << pin)  
  }

  public set() {                        
    +{ `port`.OUTSET = `pinMask` }+
  }

  public clear() {                     
    +{ `port`.OUTCLR = `pinMask` }+
  }

  public toggle() {                   
    +{ `port`.OUTTGL = `pinMask` }+ 
  }

  public bool get() {                 
    return +{ (`port`.IN & `pinMask`) != 0 }+
  }

  public bool isInput() {
    return +{ (`port`.DIR & `pinMask`) != 0 }+
  }              
  
  public bool isOutput() {
    return +{ (`port`.DIR & `pinMask`) == 0 }+
  }    
  
  public makeInput() {
    +{ `port`.DIRCLR = `pinMask` }+
  }
  
  public makeOutput() {
    +{ `port`.DIRSET = `pinMask` }+
  }
}