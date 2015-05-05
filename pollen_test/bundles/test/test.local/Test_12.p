from pollen.event import Events
from virtual.mcu import ConsolePrint as CP 

module Test_12 {
  
  host Events.Event a
  host Events.Event b
  host Events.Event c
  host Events.Event d
  host Events.Event e
  host Events.Event f
  host Events.Event g

  host Test_12() {
    a = new Events.Event(tick)
    b = new Events.Event(tick)
    c = new Events.Event(tick)
    d = new Events.Event(tick)    
    e = new Events.Event(tick)
    f = new Events.Event(tick)
    g = new Events.Event(tick)

  }

  pollen.run() {
    Events.test(e)
  }

  tick() {
    CP.printStr("TICK TICK TOCK!\n")
  }

  pollen.shutdown() {
    CP.printStr("SHUTDOWN\n")
  }
}
