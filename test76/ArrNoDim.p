module ArrNoDim {
  
  host uint8 arrh[3] = {7}
  uint8 arr[]

  public foo() {
  
    arr = arrh
    uint8 i = arr[0]
    //arrh[1] = 2
    uint8 j = arr[1]
    uint8 k = arr[2]
    print "Print array without dimensions, elements assigned to host array: \n"
    print "arr[0] " + i + ", arr[1] " + j + ", arr[2] " + k + "\n"
  }
}
