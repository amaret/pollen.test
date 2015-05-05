import pollen.environment as Bijou

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import Spark2
from bijou.pattern import Spark3
from pollen.event import Event

from pollen.time import Timer
from pollen.math import Math


module RandomSparkles {

  host Scene s1 = new Scene(25, Spark3.start, Spark3.stop)
  host Scene s2 = new Scene(25, Spark3.start, Spark3.stop)
  host Event e = new Event(requeue)
  host Timer t1 = new Timer(tick1)
  host Timer t2 = new Timer(tick2)

  pollen.run() {
    Projector.start(e)
    Projector.addScene(s1)
    Bijou.run()
  }  

  requeue() {    
    uint16 d = Math.map16(Math.rand16(), 0, 65535, 100, 4000)      // long delay    
    t1.oneshot(d)
  }

  tick1() {
    Projector.addScene(s1)
    if (Math.rand16() % 7 == 0) {
      t2.oneshot(Math.map8(Math.rand8(), 0, 255, 1, 255))
    }
  }

  tick2() {
    Projector.addScene(s2)
  }

}

