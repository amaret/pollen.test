import C4
# TEST exports when whole composition is imported,
# TEST not a module from composition.
# TEST Only fully qualified call is resolved.
module Test4 {
  test() {
    M1.foo() // should fail to find M1
    M1.bar() // should fail to find M1
    C4.N.bar()
  }
  pollen.run() { }
}
