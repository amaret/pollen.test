# TEST bug test. This error should not be emitted:
# bugs.ArrayAssign.p, line 15:17, '=': operand type error: <uint8, uint8[]>
module ArrayAssign {
  uint8 buffer[5]

  bar() {
    byte test[5] = {1, 2, 3, 4, 5}
    foo(test, 5)
  }

  foo(byte [] data, uint8 length) {
    for (uint8 i = 0; i < length; i++) {
      buffer[i] = data[i]
    }
  }
  pollen.run() {}

  public markUsed() {}

}
