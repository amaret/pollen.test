from pollen.event import Events
from virtual.mcu import ConsolePrint as CP 

module Test_12 {
  
  host new Events.Event e(tick)

  pollen.run() {
    Events.test(e)
  }

  tick() {
    CP.printStr("TICK TICK TOCK!\n")
  }

  pollen.shutdown(uint8 id) {
    CP.printStr("SHUTDOWN\n")
  }
}
