import Cls1
module TestFcnRtn {

  host new Cls1 c1()
  Cls1 c2
  uint8 r1 = 0
  bool  r2 = true

  host TestFcnRtn() {
  }

  public foo() {
    c2 = c1.returnMe()
    c2.test("c2, 1st call to test")
    //c2 = c1.returnCls1()
    //c2.test("c2, 2nd call to test")

    r1 = c1.returnUint8()
    r2 = c1.returnBool()

    print "args use local class instance object c1: \n"
    print "print arg is returned (uint8) value: " + r1 + "\n"
    print "print arg is returned (bool) value: " + r2 + "\n"

    r1 = c2.returnUint8()
    r2 = c2.returnBool()

    print "args use fcn call return object c2: \n"
    print "print arg is returned (uint8) value: " + r1 + "\n"
    print "print arg is returned (bool) value: " + r2 + "\n"
    r1 = c2.returnFld(c1)
    print "print arg is returned (uint8) field: " + r1 + "\n"
    
  }


}
