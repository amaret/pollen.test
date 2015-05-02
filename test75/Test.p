import TestFcnRtn

# TEST dereferencing function returns

module Test {
  +{ #include <stdlib.h> }+

  pollen.run() {
    TestFcnRtn.foo()
    +{ exit(0) }+
  }

}
