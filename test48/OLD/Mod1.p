import Arr
import Capacity
module Mod1 implements Capacity {

  Capacity arry := Arr

  host uint8 mod1Var = 2

  public host inc() {
    //arry.inc()
    Arr.inc()
  }
  public host set(uint8 i) {
    //arry.set(i) 
    Arr.set(i) 
  }
  public host uint8 get() {
      //return arry.get()
      return Arr.get()
  }

  host Mod1() {
    arry := Arr
    //mod1Var = arry.get()
    set(32)
    mod1Var = Arr.get()
  }
}
