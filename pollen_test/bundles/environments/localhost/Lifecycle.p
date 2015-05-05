import pollen.environment as Board

module Lifecycle {

  pollen.reset() {
    print "[RESET]\n"
    Board.reset()   
  }

  pollen.ready() {
    print "[READY]\n"
  }
  
  pollen.shutdown(uint8 id) {
    Board.shutdown()
    print "[SHUTDOWN]\n"
  }

}
