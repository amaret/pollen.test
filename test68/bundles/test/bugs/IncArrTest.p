!--
  Test to show a bug with increment operator and arrays
 --!

module IncArrTest {

  +{ #include <stdio.h> }+

  uint8 arr[1] = {0}

  pollen.run() {
    arr[0]++
    +{ printf("%d", arr[0]) }+

    ++arr[0]
    +{ printf("%d", arr[0]) }+
  }
}