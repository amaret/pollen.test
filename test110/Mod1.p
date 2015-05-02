module Mod1 {

    +{ #include <stdlib.h> }+

    real f1 = 2.2
    real f2 = 0
    real f3 = f1 * 3.1
    real arrf1[]= { 1.1, 2.3 }
    real arrf2[2]
    pollen.run() {
        print "real f1: " + f1 + "\n"
        print "real f2: " + f2 + "\n"
        print "real f3: " + f3 + "\n"
        if (f1 != f2) {
            print "(f1 != f2) is true \n"
        }
        if (f2 == 0) {
            print "(f2 == 0) is true \n"
        }
        arrf2[0] = arrf1[0]
        arrf2[1] = arrf1[1]

        print "arrf2[0] " + arrf2[0] + ", should be 1.1\n"
        print "arrf2[1] " + arrf2[1] + ", should be 2.3\n"
        +{ exit(0) }+
    }
}
