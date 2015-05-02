
from bijou.parts import Projector
from bijou.parts import LedState
from bijou.parts import Scene
from bijou.pattern import Lookup
from pollen.time import Timer

module StillColorPattern {

  const uint8 MinDuration = 5
  host Timer stopTimer = new Timer(stop)
  host LedState ledState = new LedState(0, 0, 0, 0)
  Scene currentScene = null

  public start(Scene s) {
    print "ColorPattern start...\n"
    currentScene = s
    draw()
  }
  
  public stop() {
    print "stop...\n"
    currentScene.stopped()
  }

  public setColorRGB(uint8 red, uint8 green, uint8 blue) {
    ledState.setRGB(red, green, blue)
  }

  //---------------------------------------------------------------------------
  // The draw tick - every 10ms here
  //---------------------------------------------------------------------------

  draw() {
    uint32 duration = currentScene.getDuration()
//    print "draw DURATION IS: " + duration + "...\n"
    if (duration < MinDuration) { duration = MinDuration }
    ledState.apply()
    stopTimer.oneshot(duration)
  }

}