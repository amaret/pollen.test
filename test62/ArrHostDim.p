# TEST setting a target array to have array size of a host variable.
module ArrHostDim {

  class ClsHostDim {
    uint8 targBuff_sizeHost3[sizeHost3]
    host uint8 incSize(uint8 curSize) {
       return curSize + 5
    }
    host uint8 sizeHost3 = 7
    public host ClsHostDim() {
     print "hostInit ClsHostDim() (after privateInit) :\n"
     print " sizeHost3 " + sizeHost3 + "\n"
     print "   (should be 7)\n"
     sizeHost3 = incSize(sizeHost3)
     sizeHost3 = incSize(sizeHost3)
     print "hostInit ClsHostDim() (after calling incSize) :\n"
     print " sizeHost3 " + sizeHost3 + "\n"
     print "   (should be 17)\n"
    }
    public host sizes() {
     print "sizes ClsHostDim() (after privateInit, after incSize):\n"
     print " sizeHost3 " + sizeHost3 + "\n"
    }
  }

  host ClsHostDim cls = new ClsHostDim()
  host uint8 sizeHost2 = 8
  uint8 targBuff_sizeHost2[sizeHost2]

  host uint8 incSize(uint8 curSize) {
     return curSize + 4
  }


  public host ArrHostDim() {
     print "hostInit ArrHostDim() (after privateInit) :\n"
     print " sizeHost2 " + sizeHost2 + "\n"
     print "   (should be 8)\n"
     sizeHost2 = incSize(sizeHost2)
     sizeHost2 = incSize(sizeHost2)
     print "hostInit ArrHostDim() (after calling incSize) :\n"
     print " sizeHost2 " + sizeHost2 + "\n"
     print "   (should be 16)\n"
  }
  public host sizes() {
     print "sizes ArrHostDim() (after privateInit, after incSize):\n"
     print " sizeHost2 " + sizeHost2 + "\n"

  }
}
