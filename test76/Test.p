import ArrNoDim
import FcnArrParm

# TEST Declaring and using a target array declared without dimension OR initializer.

module Test {

  +{ #include <stdlib.h> }+

        pollen.run() {
          ArrNoDim.foo()
          FcnArrParm.foo()

          +{ exit(0) }+

        }
}
