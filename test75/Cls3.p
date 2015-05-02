import Cls2
# TEST return from void fcns
class Cls3 {

  class Cls4 {
    uint8 i = 7
    public host Cls4(uint8 p) {
      i = p
    }
    public foo() {
      print "in Cls4.foo()\n"
      return
    }
  }

  host Cls4 c1 = new Cls4(2)
  host Cls2 c2 = new Cls2()

  host uint8 size = 4
  uint8 arr_Cls3[size]
  uint8 arr2_Cls3[7] = { 7 }
  bool flag = true
 
  public host Cls3() {
    size = 6
  }

  public foo() {
    uint8 i = c2.foo()
    print i + "\n"
    if (flag) {
        return
    }
    uint8 j = i
    return
  }

}
