
module Mod {

  +{ #include <stdio.h> }+

  Mod() {
    +{ printf("Mod init\n") }+
  }

  public foo() {
    +{ printf("Mod.foo\n") }+
  }
}