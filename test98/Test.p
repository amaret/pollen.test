# TEST error messages, whole array to array assignment of 
# TEST arrays of object references & instances.

module Test {
    +{ #include <stdlib.h> }+


    class Cls {
        uint8 i = 7
        public host Cls() {
            i = 1
        }
    }

    Cls arrClsTarg[3]
    host Cls arrClsHost[3] = { new Cls() }

    Cls arrClsTargNoDim[]
    host Cls arrClsHostNoDim[]

    public foo(Cls[] arr, string n) {
        print "\nIn foo()\n"
    }

    Test() {

        # these get errors

        arrClsTarg = arrClsTarg
        arrClsTarg = arrClsHost
        arrClsHost = arrClsTarg
        arrClsHost = arrClsHost
        arrClsTargNoDim = arrClsHost
        foo(arrClsTarg, "arrClsTarg")
    }

    pollen.run() {

        +{ exit(0) }+
    }
}
