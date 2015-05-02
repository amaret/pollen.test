
import Mod

# TEST executable test
# TEST simple lifecycle verification
# TEST with printf statements

module Test {
  
  +{ #include <stdio.h> }+

  Test() {
    +{ printf("Test init\n") }+
  }

  pollen.run() {
    Mod.foo()
    +{ printf("run\n") }+
  }
  
  pollen.shutdown(uint8 id) {
    +{  printf("shutdown\n") }+
  }
}
