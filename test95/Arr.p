module Arr {

  class Cls {
    #uint8 targBuff_cls[3]
    uint8 clsV = 8

    public host Cls(uint8 i) { clsV = i }
    public uint8 getClsVar() { return clsV }
  }

  host Cls clsVar = new Cls(3)
  host uint8 sizeHost = 8
  uint8 targBuff_sizeHost[sizeHost] = { 1 }
  host Cls hostBuff_clsObj[2] = { 
                                  new Cls(2), 
                                  new Cls(4) 
                                }
  //host Cls hostBuff_clsObj1[1] = { new Cls(6) , new Cls(7) }

  public host Arr() { }
  public checkAccess() {
      print "Arr: sizeHost " + sizeHost + "\n"
      uint8 i = clsVar.getClsVar()
      print "Arr: clsVar " + i + "\n"
      Cls c #= hostBuff_clsObj[1]
      c = hostBuff_clsObj[1]
      i = c.getClsVar()
      print "Arr: clsVar in hostBuff " + i + "\n"

  }
}
