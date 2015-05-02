
module FuncInfer {

  +{ #include <stdio.h> }+

  pollen.run() {
    x = foo()

    +{ printf("Min: %d", x) }+
  }

  uint8 foo() {
    return 10
  }
}