import ArrayReturnErr

module TestProg {
        +{ #include <stdlib.h> }+

        pollen.run() {
          ArrayReturnErr.foo()
          +{ exit(0) }+
        }
}
