module FcnArrParm {
  
  host uint8 arrh[3] = {7}
  uint8 arr[]

  public foo() {
    arr = arrh
    bar_targ(arr)
    bar_host(arrh)
  }
  public bar_targ(uint8[] arr) {
    print "Print targ array passed as parameter: \n"
    print "arr[0] " + arr[0] + ", arr[1] " + arr[1] + ", arr[2] " + arr[2] + "\n"
  }
  public bar_host(uint8[] arr) {
    print "Print host array passed as parameter: \n"
    print "arr[0] " + arr[0] + ", arr[1] " + arr[1] + ", arr[2] " + arr[2] + "\n"

    print "Print host array in module scope: \n"
    uint8 i = arr[0]
    print "arr[0] " + i + ", arr[1] " + arr[1] + ", arr[2] " + arr[2] + "\n"
  }
}
