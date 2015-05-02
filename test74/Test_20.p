import pollen.environment as Env
#TEST Host time print stmts for queue capacity.

from test.virtual import TestClass

module Test_20 {
  
  host new TestClass tc(testHandler)

  testHandler() {
    +{ printf("Test Handler!\n") }+
  }

  pollen.run() {
    +{ printf("Test Run!\n") }+
    tc.test()
  }

  pollen.shutdown(uint8 id) {
    +{ printf("Shutdown!\n") }+
  }

}
