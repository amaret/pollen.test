import pollen.environment as Env
from Env import Led

from pollen.time import Timer

module Test_04 {
  
  host new Timer t(tick)

  tick() {
    Led.toggle()
  }

  pollen.run() {

    Led.on()

    //t.start(250, true)
    Env.Newsroom.run()
  }

}