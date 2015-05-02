import Test1
module Mod2 {

  host uint8 mod2Var = 3

  host incMod2Var() {
    mod2Var++
  }
  host setMod2Var(uint8 i) {
    mod2Var = i
  }
  host Mod2() {
    mod2Var = 30
    Test1.setTest1Var(18)
  }

}
