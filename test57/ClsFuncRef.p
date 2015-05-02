!--
  TEST of init of function references - class
  --!

# pollen.hardware_old.HandlerP defines an empty function that I use as the func ref 
from pollen.hardware_old import HandlerP

!--

Test cases:
1. class data host function reference
   a. init in host function.
      1. to a host function // illegal
      2. to a target function
   b. init in target function
      1. to a host function // illegal
      2. to a target function
2. class data target function reference
   c. init in host function.
      1. to a host function // illegal
      2. to a target function
   d. init in target function
      1. to a host function // illegal
      2. to a target function

--!

class ClsFuncRef {

  +{ #include <stdio.h> }+

  // host function references
  host HandlerP.handler() myHandler1_Host // should be hostTheHandler
  host HandlerP.handler() myHandler2_Host // should be targetTheHandler 
  host HandlerP.handler() myHandler3_Host
  host HandlerP.handler() myHandler4_Host

  bool flag = true

  // target function references
  HandlerP.handler() myHandler1_Targ 
  HandlerP.handler() myHandler2_Targ
  HandlerP.handler() myHandler3_Targ // should be hosttheHandler
  HandlerP.handler() myHandler4_Targ // should be targtheHandler
  bool flag2 = true
  

  // host constructor
  public host ClsFuncRef() {
    setTheFuncRefOnHost1(hostTheHandler) 
    setTheFuncRefOnHost2(targetTheHandler)    
    setTheFuncRefOnHost3(hostTheHandler)    
    setTheFuncRefOnHost4(targetTheHandler)    
  }
  // target setup
  setup() {
    // hostTheHandler in this context causes c errors so test isn't runnable.
    //setTheFuncRefOnTarg1(hostTheHandler) 
    setTheFuncRefOnTarg2(targetTheHandler)    
    //setTheFuncRefOnTarg3(hostTheHandler)    
    setTheFuncRefOnTarg4(targetTheHandler)    
  }
  host setTheFuncRefOnHost1(HandlerP.handler h) { myHandler1_Host = h } // 1.a.1
  host setTheFuncRefOnHost2(HandlerP.handler h) { myHandler2_Host = h } // 1.a.2
  host setTheFuncRefOnHost3(HandlerP.handler h) { myHandler3_Targ = h } // 2.c.1
  host setTheFuncRefOnHost4(HandlerP.handler h) { myHandler4_Targ = h } // 2.c.2

  setTheFuncRefOnTarg1(HandlerP.handler h) { myHandler3_Host = h } // 1.b.1
  setTheFuncRefOnTarg2(HandlerP.handler h) { myHandler4_Host = h } // 1.b.2
  setTheFuncRefOnTarg3(HandlerP.handler h) { myHandler1_Targ = h } // 2.d.1
  setTheFuncRefOnTarg4(HandlerP.handler h) { myHandler2_Targ = h } // 2.d.2

  public foo() {
    setup()
    +{ printf("check myHandler1_Host\n") }+
    if (myHandler1_Host != null) {
        myHandler1_Host()
    }
    +{ printf("check myHandler2_Host\n") }+
    if (myHandler2_Host != null) {
        myHandler2_Host()
    }
    +{ printf("check myHandler3_Host\n") }+
    if (myHandler3_Host != null) {
        myHandler3_Host()
    }
    +{ printf("check myHandler4_Host\n") }+
    if (myHandler4_Host != null) {
        myHandler4_Host()
    }
    +{ printf("check myHandler1_Targ\n") }+
    if (myHandler1_Targ != null) {
        myHandler1_Targ()
    }
    +{ printf("check myHandler2_Targ\n") }+
    if (myHandler2_Targ != null) {
        myHandler2_Targ()
    }
    +{ printf("check myHandler3_Targ\n") }+
    if (myHandler3_Targ != null) {
        myHandler3_Targ()
    }
    +{ printf("check myHandler4_Targ\n") }+
    if (myHandler4_Targ != null) {
        myHandler4_Targ()
    }
  }
  ClsFuncRef.foo() tt

  targetTheHandler() {
    +{ printf("target Handler called\n") }+
  }

  host hostTheHandler() {
    +{ printf("host Handler called\n") }+
  }
}
