# TEST class instances versus class references
# TEST This test shows that assignment of instances 
# TEST    copies src instance to target instance, field to field.
# TEST Can assign an (addr of) an instance to a reference. 
# TEST Cannot assign a reference to an instance (error case).
# TEST This test shows that object instances are passed by reference to functions. 
# TEST   Which is to say that the pointer is passed by value. 
# TEST   So, assign a field to the passed object and it will modify the object.
# TEST   Assign a new object (and modifying the reference) will not modify the object.
# TEST   See fun() versus bar().

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
        public set_i(uint8 j) {
            i = j
        }
    }

    // reference & instances
    Cls cls 
    host new Cls host_cls()
    host new Cls host_cls2()
    host new Cls host_cls3()

    public foo(Cls p, string s) {
        print "foo(): set " + s + ".i to " + 9 + "\n"
        p.set_i(9)  // set a value in the object, does it propagate?
    }

    public bar(Cls p) {
        print "bar(): take Cls parameter p (by reference) and change it to host_cls2" + "\n"
        p = host_cls2  // change  object, does it propagate?
        p.print_i("bar() parameter, display p ")
    }

    public fun(Cls p) {
        print "fun(): take Cls parameter p (by reference) and change field value to 11" + "\n"
        p.set_i(11)
        p.print_i("fun() parameter, display p ")
    }

    pollen.run() {

        print "set cls to host_cls" + "\n"
        cls = host_cls
        cls.print_i("cls")
        host_cls = cls //error case? No. This will be a copy.

        Test.foo(cls, "cls")
        cls.print_i("cls")

        print "Check host_cls.i after foo()" + "\n"
        host_cls.print_i("host_cls")

        print "Assign host_cls2 to host_cls" + "\n"
        host_cls2 = host_cls
        host_cls2.print_i("host_cls2")

        print "\n"
        print "Check host_cls3.i for initial value" + "\n"
        host_cls3.print_i("host_cls3")
        bar(host_cls3)
        print "Check host_cls3.i after bar()" + "\n"
        host_cls3.print_i("host_cls3")

        fun(host_cls3)
        print "Check host_cls3.i after bar()" + "\n"
        host_cls3.print_i("host_cls3")

        print "\n"
        host_cls.set_i(12)
        host_cls.print_i("host_cls")
        bar(host_cls)
        print "Check host_cls.i after bar()" + "\n"
        host_cls.print_i("host_cls")

        fun(host_cls)
        print "Check host_cls.i after bar()" + "\n"
        host_cls.print_i("host_cls")

        +{ exit(0) }+
    }
}
