import pollen.environment as Env
from Env import Print
from pollen.event import Event 

module Test_13 {
  
  host new Event e(tick)

  pollen.run() {
    Env.post(e)
    Env.Dispatcher.run()
  }

  pollen.shutdown(uint8 id) {
    Print.printStr("shutdown\n")
  }

  tick() {
    Print.printStr("tick\n")
  }
}
