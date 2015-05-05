import pollen.environment as Bijou

from bijou.parts import Scene
from bijou.parts import Projector
//from bijou.pattern import SparklePattern

from bijou.pattern import ColorPatternMeta{0, 0, 0} as OffColor
from bijou.pattern import ColorPatternMeta{255, 255, 255} as OnColor


module Test5 {

  host Scene scene0 = new Scene(200, offStart)
  host Scene scene1 = new Scene(200, onStart)

  pollen.reset() {

  }

  pollen.run() {
    Projector.addScene(scene0)
    Projector.addScene(scene1)    
    // Projector.addScene(scene0)
    // Projector.addScene(scene1)        
    Projector.start()
    Bijou.run()
  }

  pollen.shutdown() {

  }

  offStart() {
    OffColor.start(scene0)
  }

  onStart() {
    OnColor.start(scene1)
  }

}