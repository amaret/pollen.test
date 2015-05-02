# TEST A bug fix: bug was getting operand type error in if conditional expr
# TEST because the subexpression cat was being calculated incorrectly when
# TEST the subexpr was a binary expr.

import IncArrTest

module OrderOfOp {

   +{ #include <stdio.h> }+
   +{ #include <stdlib.h> }+

   const uint8 NOFADE = 0
   uint8 fading = NOFADE
   uint8 fadecount = 0
   pollen.run() {

     volatile uint8 y = 3

     if (fading != NOFADE && ++fadecount == 32) {

       +{ printf("Incorrect\n") }+

     } else {

       +{ printf("Correct\n") }+
     }

     IncArrTest.foo()

     +{ exit(0) }+

   }
}
