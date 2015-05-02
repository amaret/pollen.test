import ModEnum
import ProtoEnum
import CompEnum

# TEST enums defined in own file, in composition, in protocol, and locally.
# TEST enums passed as parameters.
# TEST test host and target. runnable test.
# TEST test declaring variables with enum type: parameters, module, local scope
module HelloWorld  {

  +{ #include <stdlib.h> }+

  enum LocalEnum1 {SCLK=2, ACLK=7, NEXT, LAST}
  enum LocalEnum2 { FIRST2, NEXT2, LAST2}
  LocalEnum1 x = LocalEnum1.SCLK

  host HelloWorld() {
    test(LocalEnum1.SCLK)
    test2(CompEnum.CEnum1.ACLK, ModEnum.Y2, ProtoEnum.PEnum1.ACLK)
  }

  pollen.run() {

    targ_test(LocalEnum2.FIRST2)
    targ_test2(CompEnum.CEnum1.ACLK, ModEnum.Y2, ProtoEnum.PEnum1.ACLK)
    +{ exit(0) }+
        
  }
  host test(LocalEnum1 i) {
      LocalEnum1 j = i
    if (i == LocalEnum1.SCLK) {
       print "host test 1 passed \n"
    }
    else {
       print "host test 1 failed \n"
    }
  }

  targ_test(LocalEnum2 i) {
    if (i == LocalEnum2.FIRST2) {
       print "targ test 1 passed \n"
    }
    else {
       print "targ test 1 failed \n"
    }
  }

  host test2(CompEnum.CEnum1 i, ModEnum j, ProtoEnum.PEnum1 k) {
    if (i == CompEnum.CEnum1.ACLK) {
       print "host test2 case 1 passed \n"
    }
    else {
       print "host test2 case 1 failed \n"
    }
    if (j == ModEnum.Y2) {
       print "host test2 case 2 passed \n"
    }
    else {
       print "host test2 case 2 failed \n"
    }
    if (k == ProtoEnum.PEnum1.ACLK) {
       print "host test2 case 3 passed \n"
    }
    else {
       print "host test2 case 3 failed \n"
    }
  }

  targ_test2(CompEnum.CEnum1 i, ModEnum j, ProtoEnum.PEnum1 k) {
    if (i == CompEnum.CEnum1.ACLK) {
       print "targ test2 case 1 passed \n"
    }
    else {
       print "targ test2 case 1 failed \n"
    }
    if (j == ModEnum.Y2) {
       print "targ test2 case 2 passed \n"
    }
    else {
       print "targ test2 case 2 failed \n"
    }
    if (k == ProtoEnum.PEnum1.ACLK) {
       print "targ test2 case 3 passed \n"
    }
    else {
       print "targ test2 case 3 failed \n"
    }
  }   
} 

