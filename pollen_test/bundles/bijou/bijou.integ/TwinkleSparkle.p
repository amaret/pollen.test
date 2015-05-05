import pollen.environment as Bijou

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import Spark3
from bijou.pattern import Candle
from pollen.event import Event

from pollen.time import Timer
from pollen.math import Math


module TwinkleSparkle {

  host Scene candle = new Scene(3000, Candle.start, Candle.stop)
  host Scene spark = new Scene(50, Spark3.start, Spark3.stop)
  host Event e = new Event(requeue)
  bool candleOn = true

  pollen.run() {
    Projector.start(e)
    Projector.addScene(candle)
    Bijou.run()
  }  

  requeue() {    
    uint16 dur = 0

    if (Math.rand16() % 2 == 0) {
      Projector.addScene(spark)
    } else {
      dur = Math.map16(Math.rand16(), 0, 65535, 1000, 3000)
      candle.setDuration(dur)
      Projector.addScene(candle)
    }
  }

}

