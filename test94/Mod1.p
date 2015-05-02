from pollen.math import Math

# TEST pollen.math functions in Math
# TEST abs(), floor(), ceil()

module Mod1 {

    +{ #include <stdlib.h> }+

    int8 i8   = -1
    int16 i16 = 3
    int32 i32 = -9999

    real f1 = 1.3
    real f2 = 0.0
    real f3 = 123e4
    real f4 = -7.5

    pollen.run() {

        int8 r8 = Math.abs8(i8)
        print "abs() of " + i8 + " is " + r8 + "\n"
        int16 r16 = Math.abs16(i16)
        print "abs() of " + i16 + " is " + r16 + "\n"
        int32 r32 = Math.abs32(i32)
        print "abs() of " + i32 + " is " + r32 + "\n"

        print "floor() of " + f1 + ", is " + Math.floor(f1) + "\n"
        print "floor() of " + f2 + ", is " + Math.floor(f2) + "\n"
        print "floor() of " + f3 + ", is " + Math.floor(f3) + "\n"
        print "floor() of " + f4 + ", is " + Math.floor(f4) + "\n"

        print "ceil() of " + f1 + ", is " + Math.ceil(f1) + "\n"
        print "ceil() of " + f2 + ", is " + Math.ceil(f2) + "\n"
        print "ceil() of " + f3 + ", is " + Math.ceil(f3) + "\n"
        print "ceil() of " + f4 + ", is " + Math.ceil(f4) + "\n"

        +{ exit(0) }+
    }
}
