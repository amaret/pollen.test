import pollen.environment as Bijou

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import Twinkle

from pollen.event import Event
from pollen.time import Timer
from pollen.math import Math


module TwinkleTest {

  host Scene twinkle = new Scene(30000, Twinkle.start, Twinkle.stop)
  host Event e = new Event(requeue)
  host Timer t = new Timer(tick)

  const uint8 NumHues = 7
  const real hues[NumHues] = {0.1667, 0.2778, 0.5, 0.6556, 0.7778, 0.86, 0.9167}     
  // Yellow, green, baby blue, blue, purple, pink1, pink2

  uint8 counter = 1

  pollen.run() {
    Twinkle.setHsv(hues[0], 0.13, 1.0)
    t.start(10000)

    Projector.start(e)
    Projector.addScene(twinkle)
    Bijou.run()
  }  

  requeue() {    
    Projector.addScene(twinkle)
  }

  tick() {
    Twinkle.setHsv(hues[counter], 0.13, 1.0)
    counter++

    if (counter == NumHues) {
      counter = 0
    }
  }

}

