# TEST return array ERROR tests
# TEST test incompatible types, host phase with returned array
module ArrayReturnErr {
  uint8 bufNoDim[]
  uint8 buffer[3]
  uint8 test[5] = {1, 2, 3, 4, 5}
  uint16 errbuff[5]
  uint16 errbuff2[]

  host uint8 testHost[5] = {1, 2, 3, 4, 5}
  uint8 bufNoDimHost[]

  uint8[] bar() {
        return test
  }

  host uint8[] barHost() {
    return testHost
  }
  foobar() {
    uint8 bufNoDim1[]  // now okay 
  }

  host ArrayReturnErr() {
    bufNoDimHost @= barHost()
    bufNoDimHost = barHost()
    print "Note an array without dimension can be used at host time, eg: \"" + bufNoDimHost[0]  + "\" but it will not exit host phase initialized\n"
  }

  public foo() {
    bufNoDim @= bar()   // okay
    bufNoDim = bar()    // pollen error: '=': operand type error: <uint8[], uint8>
    errbuff @= bar()    // c error: incompatible types when assigning to type 'uint16[5]' from type 'uint8 *
    errbuff2 @= bar()   // c warning: assignment from incompatible pointer type [enabled by default]
    buffer = bar()      // c error: incompatible types when assigning to type 'uint8[3]' from type 'uint8 *'
  }
}
