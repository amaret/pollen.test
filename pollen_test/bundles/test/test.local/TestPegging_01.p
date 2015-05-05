
module TestPegging_01 {

  uint8 a[2] = {0}
  uint16 b[] @= a       // peg b to a

  +{ #include <stdio.h> }+

  pollen.run() {

    a[0] = 0xAB
    a[1] = 0xCD

    +{ printf("0x%x", b) }+
  }

  pollen.shutdown() {

  }
}