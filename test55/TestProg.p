# TEST translation of pegging operator, runtime
# TEST pegging references
# TEST Use assert to check alignment of pegged reference
module TestProg {

  +{ #include <stdio.h> }+
  +{ #include <stdlib.h> }+
  
  class Nest {
    host uint8 nest_arr1[12] = {7}
    host Nest() { }
  }

  host TestProg()  { }
  host uint8 arr1[12] = {3}
  host Nest n_host = new Nest()
  Nest n1 
  Nest n @= arr1[0]
  
  const uint8 ALIGN_8BIT  = 1
  const uint8 ALIGN_16BIT = 2
  const uint8 ALIGN_32BIT = 4

  pollen.run() {
    print "1. peg n1 to byte array arr1 at index 0\n"
    n1 @= arr1[0]

    // Commented out because line creates diffs in every test run
    // which are spurious regressions.
    //+{ printf("%s%p\n", "print \'n1\' as pointer: ", (void*) `n1`) }+
    
    pollen.assert( +{ ((int)(void*) `n1`) % `ALIGN_8BIT` == 0 }+, "assert n1 not 8 bit aligned")
    pollen.assert( +{ ((int)(void*) `n1`) % 2 == 0 }+, "assert n1 not 16 bit aligned")
    pollen.assert( +{ ((int)(void*) `n1`) % 4 == 0 }+, "assert n1 not 32 bit aligned")

    print "If no assert printed, address of n1 is 32 bit aligned\n\n"


    print "2. peg n to byte array arr1 at index 1\n"
    n @= arr1[1]    // byte aligned

    // Commented out because lines create diffs in every test run
    // which are spurious regressions.
    //+{ printf("%s%p\n","print \'n\' as pointer: ", `n`) }+
    //+{ int i = ((int)(void*) `n`) % 16; printf("%s%d\n", "address of n divided by 16 has remainder: ",i) }+
    
    pollen.assert( +{ ((int)(void*) `n`) % 1 == 0 }+, "n not 8 bit aligned")
    pollen.assert( +{ ((int)(void*) `n`) % 2 == 0 }+, "n not 16 bit aligned")
    pollen.assert( +{ ((int)(void*) `n`) % 4 == 0 }+, "n not 32 bit aligned")

   +{ exit(0) }+
  
  }


}
