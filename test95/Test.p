import ArrMod
import Arr
import ArrCls

# TEST code gen for arrays
# TEST line breaks in init of instance array: {...\n..}
# TEST Note: '\n' now only valid after comman within a list

module Test {

    +{ #include <stdlib.h> }+

        host Arr.Cls host_cls = new  Arr.Cls()
        Arr.Cls cls 
        uint8 arr[8]
        host uint32  Test_i = 4
        host Test() {
            Test_i = Test_i / 3
        }
        pollen.run() {

            cls = host_cls
            #host_cls = cls
            cls @= arr

            print Test_i + "\n"
            Arr.checkAccess()
            ArrMod.foo()
            +{ exit(0) }+
        }
}
