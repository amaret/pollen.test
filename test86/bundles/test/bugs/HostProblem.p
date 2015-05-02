import HostFoo as HF

module HostProblem {
  
  host HostProblem() {
    uint8 x = 10

    if (x == 10) {
      HF.start()
      print "Hello world!"
      HF.end()
    }

  }
}