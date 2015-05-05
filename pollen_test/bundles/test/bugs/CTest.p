
import C1

module CTest {
  
  host new C1 c(10)

  +{ #include <stdio.h> }+

  pollen.run() {  
    uint8 x 
    x = c.get()

    +{ printf("Output: %d", x) }+
  }

  pollen.shutdown() {}

}