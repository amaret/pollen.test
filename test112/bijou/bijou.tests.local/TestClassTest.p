import pollen.environment

import TestClass

module TestClassTest {
  
  host TestClass c = new TestClass()

  pollen.run() {
    c.setSomething(9).setSomething(10).setSomething(11)
    print c.getSomething()
  }

  pollen.shutdown(uint8 id) {}
}
