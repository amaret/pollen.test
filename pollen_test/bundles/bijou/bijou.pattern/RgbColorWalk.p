from pollen.time import Timer
from pollen.math import Math

from bijou.parts import Projector
from bijou.parts import LedState
from bijou.parts import Scene

module RgbColorWalk {
  
  const uint8 TickDuration = 5      // 5 milliseconds is the minimum time a frame can be displayed for
  host uint16 patternLength = 2048   // 256 * each color up and down = 256 * 8 = 2048

  host Timer drawTimer = new Timer(draw)
  host LedState ledState = new LedState(0)
  uint32 numTicks = 0
  uint32 tickCount = 0
  Scene scene = null
 
  uint8 red = 0x00
  uint8 green = 0x00
  uint8 blue = 0x00

  public start(Scene s) {
    scene = s
    uint32 dur = scene.getDuration()
    tickCount = 0

    //numTicks = (dur + TickDuration - 1) / TickDuration     // return ceil of value
    numTicks = dur / TickDuration       // return floor of value

    if (numTicks == 0) {
      numTicks = 1
    }
    drawTimer.start(TickDuration)
  }

  public stop() {
    drawTimer.stop()
    if (scene != null) {
      scene.stopped()
    }
  }

  draw() {    
    uint16 v = Math.map16(tickCount, 0, numTicks, 0, patternLength)
    uint8 state = v / 256
//    uint8 val = Lookup.gamma(v - (256*state))
    uint8 val = v - (256*state)

    if (state == 0)   { red = val }      // 0 = red up, 1 = green up, 2 = red down, 3 = blue up, 4 = green down, 5 = red up, 6 = blue down, 7 = red down
    elif (state == 1) { green = val }
    elif (state == 2) { red = 255 - val }
    elif (state == 3) { blue = val }
    elif (state == 4) { green = 255 - val }
    elif (state == 5) { red = val }
    elif (state == 6) { blue = 255 - val }
    elif (state == 7) { red = 255 - val }

    ledState.setRGBA(red, green, blue, 255).apply()

    if (tickCount == (numTicks - 1)) {
      ledState.setRGB(0, 0, 0).apply()
      stop()
    } else {
      tickCount++
    }    
  }

}