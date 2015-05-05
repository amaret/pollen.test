import pollen.environment as Env
from Env import Led
from Env import PB4
from Env import PB3
from pollen.time import Timer

module Test_05 {
  
  host new Timer t1(tick)
  host new Timer t2(togglePB3)
  host new Timer t3(togglePB4)

  Test_05() {
    PB4.clear()
    PB4.makeOutput()

    PB3.clear()
    PB3.makeOutput()
  }

  togglePB3() {
    PB3.toggle()
  }

  togglePB4() {
    PB4.toggle()
  }

  tick() {
    Led.toggle()
  }

  pollen.run() {
    
    t1.start(50, true)
    t2.start(25, true)
    t3.start(100, true)

    Env.Newsroom.run()    
  }

}