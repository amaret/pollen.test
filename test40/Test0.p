import MetaM{} as M

# TEST an 'Any' meta type instantiation.
# TEST Call via an 'Any' instance
# TEST Note meta type has defaults.

module Test0 {

  +{ #include <stdio.h> }+

  pollen.run() {

    uint8 x = M.get()    
    +{ printf("get = %d", x) }+
  }
  
  pollen.shutdown(uint8 id) {
  
  }
}
