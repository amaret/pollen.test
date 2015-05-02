# TEST arrays of class instances, arrays of  class references
# TEST and assignment to / from object instances and object references.
# TEST Assignments may require "*", "&" (on RHS operand), or nothing.
# TEST Note the temp assignments to 'cls' are a bug workaround. 

module Test {
    +{ #include <stdlib.h> }+


    class Cls {
        uint8 i = 7
        host Cls() {
            i = 1
        }
        public print_i(string n) {
            print n + ".i: " + i + "\n"
        }
        public set_i(uint8 j, string n) {
            i = j
            print "set " + n + ".i to " + i + "\n"
        }
    }

    // reference & instances
    Cls cls 
    host new Cls host_cls()
    host new Cls host_cls2()
    host new Cls host_cls3()

    Cls arrClsTarg[3]
    host Cls arrClsHost[3] = { new Cls() }

    Cls arrClsTargNoDim[]

    Test() {

        arrClsTargNoDim = arrClsTarg

        cls = arrClsHost[0]
        cls.set_i(22, "arrClsHost[0]")
        cls = arrClsHost[1]
        cls.set_i(23, "arrClsHost[1]")
        cls = arrClsHost[2]
        cls.set_i(24, "arrClsHost[2]")


        print "assign arrClsTarg[0] = arrClsHost[0]\n" 
        arrClsTarg[0] = arrClsHost[0]
        cls = arrClsTarg[0]
        cls.print_i("arrClsTarg[0]")
        cls.set_i(32, "arrClsTarg[0]")

        print "assign arrClsTarg[1] = arrClsHost[1]\n" 
        arrClsTarg[1] = arrClsHost[1]
        cls = arrClsTarg[1]
        cls.print_i("arrClsTarg[1]")
        cls.set_i(33, "arrClsTarg[1]")

        print "assign arrClsTarg[2] = arrClsHost[2]\n" 
        arrClsTarg[2] = arrClsHost[2]
        cls = arrClsTarg[2]
        cls.print_i("arrClsTarg[2]")
        cls.set_i(34, "arrClsTarg[2]")

        print "\nNow set the host arrary elements to the target array elements:\n"
        arrClsHost[0] = arrClsTarg[0]
        cls = arrClsHost[0]
        cls.print_i("arrClsHost[0]")
        arrClsHost[1] = arrClsTarg[1]
        cls = arrClsHost[1]
        cls.print_i("arrClsHost[1]")
        arrClsHost[2] = arrClsTarg[2]
        cls = arrClsHost[2]
        cls.print_i("arrClsHost[2]")

        cls = arrClsHost[2]
        cls = arrClsTarg[0]

        print "assign host_cls = arrClsHost[2]\n" 
        host_cls = arrClsHost[2]
        host_cls.print_i("host_cls")
        print "assign host_cls = arrClsTarg[1]\n" 
        host_cls = arrClsTarg[1]
        host_cls.print_i("host_cls")

    }


    public bar() {
    }

    public fun(Cls p) {
    }

    pollen.run() {

        +{ exit(0) }+
    }
}
