import pollen.environment as Env
from pollen.time import TimerManager

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

  pollen.shutdown() {
    +{ printf("Shutdown!\n") }+
  }

}