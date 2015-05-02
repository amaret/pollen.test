from C6 import N
from C11 import R as P
# TEST Use extends to resolve
# TEST P.foo should not resolve
module Test6 {
  test() {
    N.foo() # resolves via extends
    N.bar()
    // P.foo() # does not resolve
    P.cycle()
    P.reset()
  }
  pollen.run() { }
}
