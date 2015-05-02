# TEST cascaded call expressions, target fcns
module Test {
    +{ #include <stdlib.h> }+

    class Elem {
        uint32 el = 1
        public host Elem(uint32 p) {
            el = p
        }
        !---
        public set_el(uint32 v) {
            el = v
        }
        public uint32 get_el() {
            return el
        }
        ---!
    }


    class Cls {
        uint8 i = 7
        host Elem localElemHost[3] = { new Elem(2) }
        host Elem efld = new Elem(3)
        host Cls() {
            i = 1
            #localElemHost[0].set_el(6) 
            #localElemHost[1].set_el(7)
            #localElemHost[2].set_el(8)
        }
        public print_i(string n) {
            print n + ".i: " + i + "\n"
        }
        public set_i(uint8 j, string n) {
            i = j
            print "set " + n + ".i to " + i + "\n"
        }
        public set_arr(Cls[] arr, string n) {
            print "set localClsHost elements to array " + n + "\n"
        }
        public Cls bar() {
            return @
        }
        public Elem[] fun() {
            return @localElemHost
        }
    }
    // call through returns or prior expressions

    Cls cls 
    host Cls arrClsHost[3] = { new Cls() }
    Cls arrClsTarg[3] = { null }

    public foo(Cls[] arr, string n) {
        cls = arrClsHost[0]
        cls = cls.bar()

        cls.bar().print_i("cls")

        arrClsHost[0].bar().print_i("cls")
    }

    Test() {
    }

    pollen.run() {

        +{ exit(0) }+
    }
}
