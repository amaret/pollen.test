import Compos 
#TEST Using protocol member to access array functions
module Mod1 implements Capacity {

  //host uint8 mod1Var = 1
  uint8 mod1Var = 1

  public host inc() {
    Compos.ProtoMem.arr.inc()
  }
  public host set(uint8 i) {
    Compos.ProtoMem.arr.set(i)
  }
  public host uint8 get() {
    return Compos.ProtoMem.arr.get()
  }

  host Mod1() {
    print "Mod1 hostInit\n"
    set(32)
    uint8 i = get()
    mod1Var = i
    inc()
    mod1Var = get()
  }
}

