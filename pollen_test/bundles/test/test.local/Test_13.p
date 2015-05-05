import pollen.environment as Env
from Env import Print
from pollen.event import Event 

module Test_13 {
  
  host Event e = null

  host Test_13() {
    e = new Event(tick)
  }

  pollen.run() {
    Env.Newsroom.post(e)
    Env.Newsroom.run()
  }

  pollen.shutdown() {
    Print.printStr("shutdown\n")
  }

  tick() {
    Print.printStr("FUCKING TICK!!\n")
  }
}
