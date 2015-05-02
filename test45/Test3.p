from C3 import P
# TEST Same as Test2 with renaming.
# TEST N.foo() should get message not declared
module Test3 {
  test() {
    P.foo()
    P.bar()
  }
  pollen.run() {}
}
