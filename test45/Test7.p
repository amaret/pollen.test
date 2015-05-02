from C8 import N
# TEST N.bar should resolve, N.foo not.
module Test7  {
  test() {
    N.foo() 
    N.bar()
  }
  pollen.run() { }
}
