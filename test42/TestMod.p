
import TestProtocol

module TestMod implements TestProtocol {

  +{ #include <stdio.h> }+

  public test() {
    +{ printf("Im in test!") }+
  }
  
  public host testOnHost() {
  
  }
}