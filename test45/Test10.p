import C14
# TEST Use extends to resolve module
module Test10 {
  test() {
    C14.M.foo()    # resolves via import/export
    C14.Q.cycle()  # resolves via extends
  }
  pollen.run() { }
}
