import pollen.environment as Bijou

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import RgbColorWalk
from pollen.event import Event

from pollen.time import Timer
from pollen.math import Math


module ColorWalker {

  host Scene s = new Scene(10000, RgbColorWalk.start, RgbColorWalk.stop)
  host Event e = new Event(requeue)

  pollen.run() {
    Projector.start(e)
    Projector.addScene(s)
    Bijou.run()
  }  

  requeue() {    
    uint32 d = Math.map16(Math.rand16(), 0, 65535, 2000, 20000)
    s.setDuration(d)
    Projector.addScene(s)
  }

}

