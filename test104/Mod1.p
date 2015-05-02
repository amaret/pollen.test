import Cls1
import Cls2

# TEST cascaded fcn calls, target fcns

module Mod1 {

    +{ #include <stdlib.h> }+

    host new Cls1  c1(44) 
    host Cls1 arrCls1[3] = { new Cls1(1) } 

    Cls1 foo(uint8 i) {
        return c1
    }
    
    pollen.run() {

        
        print "print foo(3).getFld1(): " + foo(3).getFld1() + "\n"
        
        print "print foo(3).getArr()[0].getFld(): " + foo(3).getArr()[0].getFld() + "\n"

        print "Function call via array of references, return 7: " 
        print arrCls1[0].add(3,4) + "\n"
        #print add(arrCls1[0],3,4)

        print "Indexing array of references to call fcn which\n" 
        print "   returns array of refs used for call: " 
        print arrCls1[1].getArr()[2].getFld()

        #print getFld(getArr(arrCls1[1])[2])

        +{ exit(0) }+
    }

}
