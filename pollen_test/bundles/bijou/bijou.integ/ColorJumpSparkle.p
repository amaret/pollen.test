import pollen.environment as Bijou

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import Candle
from pollen.event import Event

from pollen.time import Timer
from pollen.math import Math


module ColorJumpSparkle {

  host Scene candle = new Scene(500000, Candle.start, Candle.stop)
  host Event e = new Event(requeue)
  host Timer t = new Timer(colorChange)

  pollen.run() {
    Projector.start(e)
    Projector.addScene(candle)
    t.start(5000)
    Bijou.run()
  }  

  requeue() {    
    Projector.addScene(candle)
  }

  colorChange() {    
    uint8 r = Math.rand8()
    uint8 g = Math.rand8()
    uint8 b = Math.rand8()

    Candle.setRGB(r, g, b)
  }

}

