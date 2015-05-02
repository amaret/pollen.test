from pollen.output import PrintProtocol
!--
An implementation of PrintProtocol for host execution.
--!

module PrintImpl implements PrintProtocol {

    +{ #include <stdio.h> }+

    public printBool(bool b) {
        if (b) {
            +{ printf("%s", "true") }+
        }
        else {
            +{ printf("%s", "false") }+
        }
    }
    public printInt(int32 i) {
        +{ printf("%i", (int)i) }+
    }
    public printReal(real f) {
        +{ printf("%f", (float)f) }+
    }
    public printUint(uint32 u)  {
        +{ printf("%u", (unsigned int)u) }+
    }
    public printStr(string s)  {
        +{ printf("%s", s) }+
    }

}
