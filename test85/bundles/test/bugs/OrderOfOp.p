
module OrderOfOp {

  +{ #include <stdio.h> }+

  const uint8 NOFADE = 0
  uint8 fading = NOFADE
  uint8 fadecount = 0
  
  pollen.run() {

    if (fading != NOFADE && ++fadecount == 32) {

      +{ printf("Correct\n") }+

    }

  }
}