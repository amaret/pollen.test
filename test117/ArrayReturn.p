# TEST return object array from function
# TEST return array of instances
# TEST return array of references
module ArrayReturn {


  class Cls1 {
      uint8 cVar = 99
      uint8 getcVar() {
          return cVar
      }
  }
  Cls1 arrCls1Ref[1] = { null}
  host Cls1 arrCls1Inst[1] = { new Cls1() }
  Cls1[] foofoo1() {
      return arrCls1Ref
  }
  Cls1[] foofoo2() {
      return arrCls1Inst
  }

  public bar() {
      arrCls1Ref[0] = arrCls1Inst[0]
      uint8 i = 0
      i = foofoo1()[0].getcVar()
      print "foofoo1() returns " + i + "\n"
      i = foofoo2()[0].getcVar()
      print "foofoo2() returns " + i + "\n"
  }

}
