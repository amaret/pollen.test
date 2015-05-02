
module PA0 {
  
  +{ #include <avr/io.h> }+

  host uint8 pinMask

  host PA0() {
    pinMask = (1 << 0)  
  }

  public set() {                        
    +{ PORTA_OUTSET = `pinMask` }+
  }

  public clear() {                     
    +{ PORTA_OUTCLR = `pinMask` }+
  }

  public toggle() {                   
    +{ PORTA_OUTTGL = `pinMask` }+ 
  }

  public bool get() {                 
    return +{ (PORTA_IN & `pinMask`) != 0 }+
  }

  public bool isInput() {
    return +{ PORTA_DIR & `pinMask` != 0 }+
  }              
  
  public bool isOutput() {
    return +{ PORTA_DIR & `pinMask` == 0 }+
  }    
  
  public makeInput() {
    +{ PORTA_DIRCLR = `pinMask` }+
  }
  
  public makeOutput() {
    +{ PORTA_DIRSET = `pinMask` }+
  }

}

