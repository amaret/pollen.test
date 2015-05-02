# TEST host initialization.
# TEST note that if e is initialized on the dcln
# TEST it will have NaN values output because of
# TEST order of init issues. To be init correctly
# TEST must be init the host constructor. 

from pollen.event import Events
from virtual.mcu import ConsolePrint as CP 

module Test_12 {
  
  //host new Events.Event e(tick)  // wrong
  host Events.Event e              // right

  pollen.run() {
    Events.test(e)
  }
  host Test_12() {
    e = new Events.Event(tick)
  }

  tick() {
    CP.printStr("TICK TICK TOCK!\n")
  }

  pollen.shutdown(uint8 id) {
    CP.printStr("SHUTDOWN\n")
  }
}
