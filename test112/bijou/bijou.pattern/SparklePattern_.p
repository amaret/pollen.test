
//from bijou.parts import Projector
//from bijou.parts import Color
from bijou.parts import Scene
//from bijou.pattern import Lookup
from pollen.time import Timer
//from pollen.event import Event

module SparklePattern {

  host Timer stopTimer = new Timer(stop)
  // host Event drawEvent = new Event(draw)
  // host Color colr = new Color(0, 0, 0, 0)
  Scene curScene = null
  // bool keepDrawing = false

  public start(Scene s) {
    
    // drawEvent.post()
    curScene = s    
    uint32 dur = curScene.getDuration()
    stopTimer.oneshot(dur)
  }
  
  public stop() {
    // keepDrawing = false
    // curScene.stopped()
  }

  //---------------------------------------------------------------------------
  // The draw tick
  //---------------------------------------------------------------------------

  draw() {    
    // for (int16 i = 255; i > 0; i -= 4) {
    //   uint8 val = Lookup.gamma(i)      
    //   colr.setRGB(val, val, val)
    //   Projector.add(colr)
    // }
  }

}