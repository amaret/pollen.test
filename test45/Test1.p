from C1 import N  
# TEST calling non-exported function
# TEST N.bar() should get message is not declared
# TEST NOTE N module is not exported or call would resolve
module Test1 {
   test1() {
      N.foo()
      N.bar()
   }
   pollen.run() {}
}
