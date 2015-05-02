import Cls2

class Cls1 {

    host uint8 fld = 0
    host Cls2 arrCls2[3] = { new Cls2(1), new Cls2(2), new Cls2(3) }

    public host uint8 chkFld() {
        return arrCls2[0].getF()
    }

    public host Cls1(uint8 i) {
        print arrCls2[0].getF()
        fld = i
    }

    public uint8 add( uint8 i, uint8 j) {
        return i + j
    }
    public uint8 getFld1() {
        return fld
    }
    public setFld(uint8 f) {
        fld = f
    }
    public prnFld() {
        print "fld = " + fld + "\n"
    }
    public Cls2[] getArr() {
        return arrCls2 // return host arr, add '&'
    }
    public Cls2[] getArr2(Cls2[] arr) {
        return arr  // return parameter, no '&'
    }
}
