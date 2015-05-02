import MetaM{, uint8} as M
import Test1
import Test2
import Test3

# TEST various meta module instantiations:
# TEST missing 1st of 2 parameter (use default value)
# TEST missing 2nd of 2 parameter (use default value)
# TEST missing all parameters (use all default values)
# TEST generate as 'Any'


module Test0 {

  +{ #include <stdio.h> }+

  pollen.run() {

    +{ printf("hello out there") }+
  }
  
  pollen.shutdown(uint8 id) {
  
  }
}
