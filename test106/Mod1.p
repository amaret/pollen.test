import Cls1
# TEST using "@=" peg to peg a byte arrary with no dim to a byte array
# TEST which is init with a character set.
# TEST Also assignment of string var to array with no dim,
# TEST this allows you to edit strings dynamically, see below.
module Mod1 {
    +{ #include <stdlib.h> }+
    uint32 arrNoDim32[]
    byte arrNoDim[]
    byte arrStr[] = { 'h', 'e', 'l', 'l', 'o' }
    host new Cls1 cref()
    pollen.run() {
        arrNoDim @= arrStr
        // prints element 0 as uint8
        print "arrNoDim[0]: " + arrNoDim[0] + "\n"

        string str 
        str = arrNoDim[0]                   
        // str is assigned elem 0 but prints string to '\0' 
        print "str assigned from arrNoDim: " + str + "\n"

        str = arrNoDim[1]                   
        // prints string starting at idx 1 to '\0' 
        print "arrNoDim[1] to end: " + str + "\n"

        // uses arrNoDim to change a string character
        arrNoDim[3] = 'z'
        str = arrNoDim                   
        print "arrNoDim 4th elem is 'z': " + str + "\n"

        str = arrStr                   
        // arrStr contains changed element because arrStr and arrNoDim 
        // are overlaid due to pegging.
        print "arrStr via str: " + str + "\n"

        arrNoDim @= str
        // index through string via arrNoDim
        // Note arrNoDim elements here CAN be written!
        // No bus error because the string it points to
        // located in writeable memory (see dcln of arrStr)
        for (uint8 i = 0; arrNoDim[i] != '\0'; i++) {
            str = arrNoDim[i]                   
            print str + "\n"
            print "char " + arrNoDim[i] + "\n"
        }
        string s = "hello world"  // NOT WRITEABLE
        arrNoDim @= s
        for (i = 0; arrNoDim[i] != '\0'; i++) {
            print "char " + arrNoDim[i] + "\n"
            // Note arrNoDim elements here CANNOT be written!
            // Will cause bus error because arrNoDim
            // NOT located in writeable memory (see assign of str)
            // arrNoDim[3] = '7'
        }
        cref.checkStuff()
        +{ exit(0) }+
    }
}
