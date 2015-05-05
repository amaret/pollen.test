import pollen.environment as Bijou

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import Candle
from pollen.event import Event

from pollen.time import Timer
from pollen.math import Math


module ColorWalkSparkle {

  host Scene candle = new Scene(10000, Candle.start, Candle.stop)
  host Event e = new Event(requeue)
  host Timer t = new Timer(colorChange)

  uint16 count
  uint8 red = 0x00
  uint8 green = 0x00
  uint8 blue = 0x00


  pollen.run() {
    Projector.start(e)
    Projector.addScene(candle)
    t.start(10)
    Bijou.run()
  }  

  requeue() {    
    Projector.addScene(candle)
  }


  colorChange() {    
    uint8 state = count / 256
    uint8 val = count - (256*state)

    if (state == 0)   { red = val }      // 0 = red up, 1 = green up, 2 = red down, 3 = blue up, 4 = green down, 5 = red up, 6 = blue down, 7 = red down
    elif (state == 1) { green = val }
    elif (state == 2) { red = 255 - val }
    elif (state == 3) { blue = val }
    elif (state == 4) { green = 255 - val }
    elif (state == 5) { red = val }
    elif (state == 6) { blue = 255 - val }
    elif (state == 7) { red = 255 - val }

    Candle.setRGB(red, green, blue)

    if (count++ == 2048) {
      count = 0
    }
  }

}

