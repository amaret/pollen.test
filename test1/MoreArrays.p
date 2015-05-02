module MoreArrays {

  class LittleBit {
     host uint8 ii = 2
     host bool f  = true
  }

  host LittleBit lf = new LittleBit()

  host uint8 LEN = 3
  uint8 arr[LEN]

  public foo() {
    const uint8 LEN1 = 3
    uint8 arr1[LEN1]
    #while (recieve() != '#') {}
    while (recieve() != '#');
  }

  byte recieve() {
    byte b = 'a'
    return b
  }

  host chkHostPrint() {
    print "test host (javascript) print:\n"
    print "hello! Test a host print with a number: " + LEN
    print LEN
    print "\n"
    print 4.4 +  " is a real literal.\n"
    print "Now an object: " +  lf 
    print "\n"
    print "And bool: " +  lf.f +  "\n" 
    
  }

  host uint8 len2 = 3
  host uint8 arr2[len2]


  host MoreArrays() {
    chkHostPrint()
  }
  public markUsed() {}

}
