

from bijou.parts import Scene
from bijou.parts import LedState
from bijou.parts import Projector
from bijou.pattern import Lookup
from pollen.math import Math
from pollen.time import Timer

module Spark {

  const uint8 MinDuration = 5

  const uint8 DataCount = 32
  const uint8 sparkData[DataCount] = {255,201,159,124,96,74,56,42,31,23,17,12,8,6,4,2,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,}

  host Timer drawTimer = new Timer(draw)
  host LedState led = new LedState(0)
  int8 count = 0
  uint8 step = 1
  Scene scn = null

  public start(Scene s) {
    scn = s
    uint32 duration = scn.getDuration()
    
    if ((duration / DataCount) < MinDuration) {
      duration = MinDuration
    } else {
      duration = duration / DataCount
    }

    count = 0
    drawTimer.start(duration)
  }
  
  public stop() {
    drawTimer.stop()
    scn.stopped()
  }

  //---------------------------------------------------------------------------
  // The draw tick - every 10ms here
  //---------------------------------------------------------------------------

  draw() {
    if (count < DataCount) {
      uint8 val = sparkData[count]
      led.setRGBA(val, val, val, 255).apply()
      count++
    } else {
      stop() 
    }  
  }

}