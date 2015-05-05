// See if the event class works..
import pollen.environment as Env
from pollen.event import Event

from virtual.mcu import ConsolePrint as Console

module Test_07 {
  
  host new Event myEvent(tick)

  // host Test_07() {
  //   myEvent.setHandlerOnHost(tick)
  // }

  pollen.run() {
    myEvent.fire()
  }

  tick() {
    Console.printStr("TICK\n TICK\n TICK\n")    
  }

  pollen.shutdown() {

  }
}
