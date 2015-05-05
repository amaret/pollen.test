import pollen.environment as Bijou

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import Candle
from bijou.pattern import Spark
from bijou.pattern import Spark1
from bijou.pattern import Spark2
from bijou.pattern import Spark3
from pollen.event import Event

from pollen.time import Timer
from pollen.math import Math


module PatternTest {
  
//  host Scene candle = new Scene(100, Candle.start, Candle.stop)

  host Scene spark = new Scene(25, Spark.start, Spark.stop)         // 7 to 8
  host Scene spark1 = new Scene(25, Spark1.start, Spark1.stop)      // 5
  host Scene spark2 = new Scene(25, Spark2.start, Spark2.stop)      // 9  
  host Scene spark3 = new Scene(25, Spark3.start, Spark3.stop)      // 

  host Event e = new Event(requeue)
  host Timer t = new Timer(tick)

  uint8 count = 0
  uint8 sp = 0

  pollen.run() {
    Projector.start(e)
    Projector.addScene(spark3)
    Bijou.run()
  }

  requeue() {    
    uint16 d = Math.map16(Math.rand16(), 0, 65535, 5, 1000)
    t.oneshot(d)
  }

  tick() {
    Projector.addScene(spark3)
  }

}


// randomly select one or two blinks
//  if two blinks, 
//    randomly select a short time between the blinks 
//  blink the lights
// delay a random amount of medium time between the blinks