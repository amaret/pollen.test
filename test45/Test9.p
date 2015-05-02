import C10 as Z 
import C10 
# TEST Use extends to resolve
# TEST P.foo should not resolve
module Test9 {
  test() {
    Z.foo() # resolves via extends
    Z.bar()
    C10.foo() # resolves via extends
    C10.bar()
  }
  pollen.run() { }
}
