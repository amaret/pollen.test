
module Cpu {

  host uint32 freq = 0
  public host uint32 getFreq() {
    return freq
  }
  public host setFreq(uint32 f) {
    freq = f
  }
  host Cpu() {
    print "Cpu hostInit: freq " + freq + "\n"
  }
}

