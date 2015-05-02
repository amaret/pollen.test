
module VarInScope {
  
  uint8 foo() { return 10 }

  pollen.run() {

    if (1 == 1) {
      x = foo()
    } 

    elif (2 == 2) {
      x = foo()
    }
  }
}