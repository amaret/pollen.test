
import MetaPinTest{0, 1} as MPT1
import MetaPinTest{0, 2} as MPT2

module MetaPinTestMod {
  
  pollen.run() {
    MPT1.foo()
    MPT2.foo()
  }

  pollen.shutdown() {

  }
  
}