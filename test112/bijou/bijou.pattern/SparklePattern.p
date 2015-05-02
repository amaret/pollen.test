
from bijou.parts import Projector
from bijou.parts import Color
from bijou.parts import Scene
from bijou.pattern import Lookup
from pollen.time import Timer
//from pollen.event import Event

module SparklePattern {

  //host Event drawEvent = new Event(draw)
  const uint8 MinDuration = 5
  const uint8 DataCount = 32
  const uint8 sparkleData[DataCount] = {255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
  host Timer drawTimer = new Timer(draw)
  host Color colr = new Color(0, 0, 0, 0)
  int16 count = 0
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
    print "SparklePattern Timer started, duration is: " + duration + "\n"
  }
  
  public stop() {
    drawTimer.stop()
    scn.stopped()
    print "SparklePattern Stopped\n"
  }

  //---------------------------------------------------------------------------
  // The draw tick - every 10ms here
  //---------------------------------------------------------------------------

  draw() {
    print "SparklePattern draw.."
    if (count < DataCount) {
      print "drawing count= " + count + "..\n"
      uint8 val = sparkleData[count]
      colr.setRGB(val, val, 0)
      Projector.setColor(colr)
      count++
    } else {
      print "..stopping..\n"
      stop() 
    }  
  }

}