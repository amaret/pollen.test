import Mod1
import Proto1
# TEST translation of pegging operator, error messages
# TEST initialize protocol member in module body

module TestProg {
  
  +{ #include <stdio.h> }+

  class Nest {
    host uint8 arr1[12] = {7}
    host Nest() {
    }
  }
  host bool myFlag = false
  bool myFlag2 = false
 
  Proto1 m1 := Mod1 // test module body initialization

  host Nest n_host = new Nest()
  Nest n1 
  host uint8 arr1[12] = {3}
  uint16 arrChk[];

  host TestProg()  {
     n1 = n_host
     myFlag = true
  }

  Nest n @= arr1[0]

  pollen.run() {
    n1 = n_host
    n1 @= arr1[0]
    n_host @= arr1[4]

    //m1.foo()

    m1  @= arr1[0]  // test error check
    n @= arr1[1]    // byte aligned
    n_host @= arr1[16] // past array boundary

    uint8 a[2] = {0}
    uint16 b[] //@= a       // peg b to a
    b @= a       // peg b to a
    a[0] = 0xAB
    a[1] = 0xCD
  }

  fcnpeg(uint8[] arr) {
      uint8 local[]  //@= arr
      local @= arr
  }

}
