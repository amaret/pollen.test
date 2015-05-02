from C12 import M  
# TEST should not be able to import M
# TEST gets msg that M is not exported unit
# TEST M is not exported from C12
module Test8 {
   test1() {
     M.foo()
   }
   pollen.run() {}
}
