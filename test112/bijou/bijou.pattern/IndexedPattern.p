from pollen.time import Timer
from bijou.parts import Projector
from bijou.parts import LedState
from bijou.parts import Scene
from bijou.pattern import Lookup


module IndexedPattern {
  
  const uint8 TickDuration = 5      // 5 milliseconds is the minimum time a frame can be displayed for

  // configurable params 
  //host uint8 patternLength = 255
  host uint8 patternLength = 64

  host Timer drawTimer = new Timer(draw)
  host LedState ledState = new LedState(0, 0, 0, 0)
  uint16 numTicks = 0
  uint16 tickCount = 0
  Scene scene = null

//  uint8 data[64] = {255,217,178,140,101,63,55,53,52,51,50,49,47,46,45,44,43,42,40,39,38,37,36,34,33,32,31,30,28,27,26,25,24,22,21,20,19,18,16,15,14,13,12,11,9,8,7,6,5,3,2,1,0,0,0,0,0,0,0,0,0,0,0,0}
  uint8 data[64] = {255,255,255,255,255,251,246,242,237,233,228,224,219,215,211,206,202,197,193,188,184,180,175,171,166,162,158,153,149,145,140,136,132,127,123,119,115,110,106,102,98,93,89,85,81,76,72,68,64,59,55,51,47,42,38,34,30,25,21,17,13,8,4,0}

  public start(Scene s) {
    print "Starting indexed pattern\n"
    scene = s
    uint32 dur = scene.getDuration()
    tickCount = 0

    //numTicks = (dur + TickDuration - 1) / TickDuration     // return ceil of value
    numTicks = dur / TickDuration       // return floor of value

    if (numTicks == 0) {
      numTicks = 1
    }
    print "Starting indexed pattern timer, numTicks=" + numTicks + "\n"
    drawTimer.start(TickDuration)
  }

  public stop() {
    print "Stopping pattern timer\n"
    drawTimer.stop()
    if (scene != null) {
      scene.stopped()
    }
  }

  draw() {    
    uint8 v = Lookup.map(tickCount, 0, numTicks, 0, patternLength)
    uint8 val = data[v]
    print "Drawing, tickCount=" + tickCount + " v=" + v + " and val=" + val + "\n"

    ledState.setRGB(val, val, val).apply()

    if (tickCount == (numTicks - 1)) {
      ledState.setRGB(0, 0, 0).apply()
      stop()
    } else {
      tickCount++
    }    
  }

}