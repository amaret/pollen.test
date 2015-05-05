

module ArrayAssign {
  
  uint8 buffer[5]

  pollen.run() {
    byte test[5] = {1, 2, 3, 4, 5}

    foo(test, 5)
  }

  foo(byte [] data, uint8 length) {
    for (uint8 i = 0; i < length; i++) {
      buffer[i] = data[i]
    }
  }

  pollen.shutdown() {
    
  }

}