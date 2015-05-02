from C5 import M1
from C5 import N
# TEST what happens when exported functions have
# TEST colliding names (different modules, same function names).
module Test5 {
  test() {
    M1.foo() 
    M1.bar() 
    N.bar()
  }
  pollen.run() { }
}
