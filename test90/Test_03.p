# TEST the test used in How Tos

import pollen.environment as Env 
from Env import Led0 as Led

from pollen.time import Timer

module Test_03 {

  +{ #include <stdlib.h> }+
  
  host new Timer t1(tick)
  uint32 count = 0

  tick() {
    Led.toggle()
    count++
    if (count > 10) {
        // not in How To's but I need to terminate
        print "Done!\n"
        +{ exit(0) }+
    }
  }

  pollen.run() {

    t1.start(500)
    Env.Newsroom.run()
  }

}
