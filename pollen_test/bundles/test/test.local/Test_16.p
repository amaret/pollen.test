import pollen.environment as Env 
from Env import Print

from pollen.event import Event 

module Test_16 {
  
  host Event e1 = new Event(tick1)
  host Event e2 = new Event(tick2)

  host Test_16() {
  }

  pollen.run() {

    e1.post()
    e2.post()

    Env.Newsroom.run()
  }

  tick1() {
    Print.printStr("Tick1\n")
  }

  tick2() {
    Print.printStr("Tick2\n")
  }


  pollen.shutdown() {
    Print.printStr("Shutdown\n")
  }

}
