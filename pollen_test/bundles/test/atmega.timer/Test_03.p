import pollen.environment as Env 
from Env import Led

from pollen.time import Timer

module Test_03 {
  
  host new Timer t1(tick)

  Test_03() {
  }

  tick() {
    Led.toggle()
  }

  pollen.run() {

    t1.start(500, true)
    Env.Newsroom.run()
  }

}