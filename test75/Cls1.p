class Cls1 {

  // this causes javascript out of heap space exception
  // host new Cls1 meTypeObj()

  uint8 fld = 7

  public uint8 returnUint8() {
    return 99
  }
  public uint8 returnFld(Cls1 arg) {
    return arg.fld
  }
  public bool returnBool() {
    return false
  }
  public Cls1 returnMe() {
    return @
  }
  //public Cls1 returnCls1() {
  //  return meTypeObj
  //}
  public test (string s) {
    print s + "\n"
  }
}
