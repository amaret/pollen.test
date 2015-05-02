
import TestProtocol
// include stdlib.h is required for use of exit()
// exit() call is needed oj code will not terminate
// newline termination is needed on string or printf will not flush (print) 

module TestMod implements TestProtocol {

  +{ #include <stdio.h> }+
  +{ #include <stdlib.h> }+

  public test() {
    +{ printf("Im in test!\n") }+
    +{ exit(0) }+
  }
}
