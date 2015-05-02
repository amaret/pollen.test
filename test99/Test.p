# TEST pass a host array of class elements to a function and access an element
# TEST correct array element access within function
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
    // reference & instance array
    Cls cls 
    host Cls arrClsHost[3] = { new Cls() }

    public foo(Cls[] arr, string n) {
        print "\nIn foo(), print element 1 of " + n + "\n"
        cls = arr[0]
        cls.print_i(n)
    }

    Test() {

        foo(arrClsHost, "arrClsHost")
    }

    pollen.run() {

        +{ exit(0) }+
    }
}
