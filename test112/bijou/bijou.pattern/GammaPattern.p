
from bijou.parts import Projector
from bijou.parts import Color
from bijou.parts import Scene
from bijou.pattern import Lookup
from bijou.pattern import PatternParameters
from pollen.time import Timer

module GammaPattern {

  host PatternParameters params = new PatternParameters(256)
  host Timer drawTimer = new Timer(draw)
  host Color colr = new Color(0, 0, 0, 0)

  public start(Scene s) {
    params.setScene(s)  
    drawTimer.start(params.getDrawRate())
  }
  
  public stop() {
    Scene s = params.getCurrentScene()    
    drawTimer.stop()
    s.stopped()
  }

  //---------------------------------------------------------------------------
  // The draw tick
  //---------------------------------------------------------------------------

  draw() {
    uint8 val = Lookup.gamma(params.getCount())
    colr.setRGB(val, val, val)
    Projector.addColor(colr)

    if (!params.update()) {     // returns false when its time to stop updates (pattern ended)
      stop()
    }
  }

}