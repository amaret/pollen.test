
class Cls2 {

    host uint8 fld = 0

    public host Cls2(uint8 i) {
        fld = i
    }

    public uint8 add( uint8 i, uint8 j) {
        return i + j
    }
    public host uint8 getF() {
        return 9
    }
    public uint8 getFld() {
        return fld
    }
    public setFld(uint8 f) {
        fld = f
    }
    public prnFld() {
        print "fld = " + fld + "\n"
    }
}
