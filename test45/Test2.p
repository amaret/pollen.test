from C2 import N
# TEST Test2 imports C2 which imports C1
# TEST N.foo is exported from C1 not C2
# TEST N.foo() should get message not declared in Test2
# TEST Note If N is exported call would resolve

module Test2 {
  test() {
    N.foo()
    N.bar()
  }
  pollen.run() {}
}
  
