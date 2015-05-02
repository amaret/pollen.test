from Mcu import Cpu
# TEST err msg from assigning a value to a preset outside a preset initializer
# TEST NOTE these errors should result in valid code with error code not generated
# TEST correct setting of variable in a preset : result should be PASS
module TestProg {

  host uint32 test_freq = 0

  // now this aborts
  # err msg from a preset in a non-composition
  //preset TestProg() {
  // test_freq = 2
  //}

  host TestProg() {
    test_freq = Cpu.getFreq()
    string ss
    if (test_freq == 6) {
      ss = "PASS"
    }
    else {
      ss = "FAIL"
    }
    print "TestProg hostInit: " + ss + "\n"
  }
  pollen.run() {
    print "pollen.run: test_freq " + test_freq + "\n"
  }

}


