module IncArrTest {

  +{ #include <stdio.h> }+

  uint8 arr[1] = {0}

  public foo() {
    arr[0]++
    +{ printf("%d ", `arr`[0]) }+

    ++arr[0]
    +{ printf("%d", `arr`[0]) }+
  }
}
