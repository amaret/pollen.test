import On1
import OnP

# TEST A non-working test. Playing around with calling functions with class refs.

module TestProg {

  +{ #include <stdlib.h> }+

  host On1 on1Ref = null // new On1() //null
  host On1 on2Ref = null
  host On1 on3Ref = null

  // class ref
  // initializing to references gives me the object if the object is host.
  host On1 on1Arr [3] = { on1Ref, on2Ref, on3Ref }
  //host On1 on2Arr [3] = { on1Ref, on2Ref, on3Ref }
  
  // protocol
  //OnP onPArr [3] = { on1Ref, on2Ref, on3Ref }

  host TestProg() {
    //on1Ref = new On1()
  }
  TestProg() {
    //on2Ref = on1Ref
  }

  pollen.run() {

    print "5. Array of class refs: call 'on' \n"
    for (uint8 i = 0; i < 3; i++) {
       On1 o = on1Arr[i]
       o.on(i)
       //on1Arr[i].on(i)
    }

    +{ exit(0) }+
  }

}
