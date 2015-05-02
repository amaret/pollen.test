import FcnProto
import FcnImpl
import EventHandler{uint8} as Handler
import Event{uint8} // default meta parameter type is uint8

// TEST function references: create, assign, invoke through
// TEST module, class, protocol function references

module HelloWorld  implements Handler {

  +{ #include <stdlib.h> }+

  new Event e1(handle, 1)   // handle is function reference
  new Event e2(handle, 2)

  bool start (Event e) {
    return true;
  }

  pollen.run() {
        
    start(e1 )
    start(e2)
    fcnrefsAssign()
    fcnrefsCalls()
    fcnrefsParameters(bar_uint8, bar2_bool,  bar4_uint32_and_rtn, null, modFcnRef)
    +{ exit(0) }+
  }
  public handle(uint8 id) { // cause implements error message
    uint8 x = 3
  }   
 
  FcnProto fp := FcnImpl
  FcnImpl.foo_proto(uint8) fp_impl
  FcnProto.foo_proto(uint8) proto_ref

  (uint8 FcnImpl.foo_proto(uint8)) fp_impl2 // with return type

  host HelloWorld() {
    //fp := FcnImpl
    proto_ref = fp_impl
  }

  class Inner {
     foo() {}
     host Inner() {}
  }

  // Class function refs not implemented
  //Inner innr = new Inner()
  Inner.foo() clsFcnRef
  //clsFcnRef = innr.foo

  FcnImpl.foo_proto(uint8) modFcnRef

  // functions foo
  foo(uint8 p) {print ">> in foo()\n"}
  uint8 foo2(uint8 p) { print ">> in foo2()\n"; return 2 }

  // functions bar
  bar(uint8 p) { print ">> in bar()\n"}
  bar2(bool p) { print ">> in bar2()\n"}
  bar3(uint32 p) { print ">> in bar3()\n"}
  uint8 bar4(uint8 p) {  print ">> in bar4()\n"; return 1 }
  bar5(uint16 p) {print ">> in bar5()\n" }
  uint8 bar5_and_rtn(uint16 p) { print ">> in bar5_and_rtn()\n"; return 1 }

  // refs to functions foo
  foo(uint8) foo_uint8
  (uint8 foo2(uint8)) foo2_uint32_rtn

  // refs to functions bar
  bar(uint8) bar_uint8
  bar2(bool)  bar2_bool
  (bar3(uint32)) bar3_uint32
  (uint8 bar4(uint32)) bar4_uint32_and_rtn
  bar5(uint16) bar5_uint16
  (uint8 bar5_and_rtn(uint16)) bar5_uint16_and_rtn

  // test assignments
  // c warning marked below:
  // "assignment from incompatible pointer type [enabled by default]"
  fcnrefsAssign() {
    // assignments
    foo_uint8 = bar_uint8                 //  ok
    foo_uint8 = bar2_bool                 // warning
    foo_uint8 = bar3_uint32               // ok
    foo_uint8 = bar5_uint16               // warning
    foo_uint8 = bar4_uint32_and_rtn       // warning
    bar3_uint32 = bar4_uint32_and_rtn     // warning

    bar5_uint16 = bar5_and_rtn            // fcn ref not defined with return but fcn has one: otherwise identical. Gets warning.
    bar5_uint16_and_rtn = bar5_and_rtn    // ok
  }
  fcnrefsCalls() {
    // calls
    print "Enter fcnrefsCalls:\n"
    uint8 rtn = bar4_uint32_and_rtn(3)    // ok
    rtn = foo2_uint32_rtn(1)              // ok
    foo2_uint32_rtn = bar4_uint32_and_rtn // ok
    //foo_uint8()                         // gets gcc error: missing parameter
    foo_uint8(1)
    //uint8 i = bar5_uint16(2)            // gets gcc error: void (rtn) value not ignored as it should be
    uint8 i = bar5_uint16_and_rtn(2)
    print "Leave fcnrefsCalls\n"
  }
  fcnrefsParameters(bar b1, bar2 b2, bar4 b4, Inner.foo cf, FcnImpl.foo_proto mf) {
    print "Enter fcnrefsParameters:\n"
     b1(1)
     b2(true)
     uint32 r 
     r = b4(5)
     // cf()                              // a class function causes seg fault
     mf(3)
    print "Leave fcnrefsParameters\n"
  }
 
  testFcns() {
     fcnrefsParameters(bar_uint8, bar2_bool,  bar4_uint32_and_rtn, null, modFcnRef)
  }
} 
