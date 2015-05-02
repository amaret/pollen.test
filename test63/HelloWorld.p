import ModEnum
import ProtoEnum
import CompEnum

# TEST enums defined in own file, in composition, in protocol, and locally.
# TEST test host and target. runnable test.
module HelloWorld  {

  +{ #include <stdlib.h> }+

  enum LocalEnum1 {SCLK=2, ACLK=7, NEXT, LAST}
  enum LocalEnum2 { FIRST2, NEXT2, LAST2}

  host HelloWorld() {
    test()
  }

  pollen.run() {

    targ_test()
    +{ exit(0) }+
        
  }
  host test() {
    uint8 x = LocalEnum1.SCLK
    uint8 y = LocalEnum1.ACLK
    uint8 z = LocalEnum1.NEXT
    uint8 z1 = LocalEnum1.LAST
    if ( x == 2 && y == 7 && z == 8 && z1 == 9) {
      print "PASS LocalEnum1 (host) \n"
    }
    else {
      print x + " " + y + " " + z + " " + z1 + "\n " 
      print "FAIL LocalEnum1 (host) \n "
    }
    x = LocalEnum2.FIRST2
    y = LocalEnum2.NEXT2
    z = LocalEnum2.LAST2
    if ( x == 0 && y == 1 && z == 2 ) {
      print "PASS LocalEnum2 (host) \n"
    }
    else {
      print x + " " + y + " " + z +  "\n " 
      print "FAIL LocalEnum2 (host) \n "
    }
    x = CompEnum.CEnum1.NEXT
    y = ProtoEnum.PEnum2.NEXT
    z = ModEnum.Y2
    if ( x == 8 && y == 1 && z == 2 ) {
      print "PASS Comp, Proto, Mod enums (host) \n"
    }
    else {
      print x + " " + y + " " + z +  "\n " 
      print "FAIL Comp, Proto, Mod enums (host) \n"
    }
  }

  targ_test() {

    uint8 x = LocalEnum1.SCLK
    uint8 y = LocalEnum1.ACLK
    uint8 z = LocalEnum1.NEXT
    uint8 z1 = LocalEnum1.LAST
    if ( x == 2 && y == 7 && z == 8 && z1 == 9) {
      print "PASS LocalEnum1 (target) \n"
    }
    else {
      print x + " " + y + " " + z + " " + z1 + "\n "
      print "FAIL LocalEnum1 (target) \n "
    }
    x = LocalEnum2.FIRST2
    y = LocalEnum2.NEXT2
    z = LocalEnum2.LAST2
    if ( x == 0 && y == 1 && z == 2 ) {
      print "PASS LocalEnum2 (target) \n"
    }
    else {
      print x + " " + y + " " + z +  "\n "
      print "FAIL LocalEnum2 (target) \n "
    }

    x = ProtoEnum.PEnum1.NEXT
    y = ProtoEnum.PEnum2.NEXT
    z = ModEnum.Y2
    if ( x == 8 && y == 1 && z == 2 ) {
      print "PASS ProtoEnum & ModEnum (target) \n"
    }
    else {
      print x + " " + y + " " + z +  "\n "
      print "FAIL ProtoEnum & ModEnum (target) \n "
    }   

    x = CompEnum.CEnum1.NEXT
    y = CompEnum.CEnum2.NEXT
    if ( x == 8 && y == 1 ) {
      print "PASS CompEnum (target) \n"
    }
    else {
      print x + " " + y +  "\n "
      print "FAIL CompEnum (target) \n "
    }   
  }   
} 

