import pollen.environment as Bijou

from bijou.pattern import GammaPattern
from bijou.pattern import SinePattern
from bijou.pattern import SparklePattern
from bijou.parts import Scene
from bijou.parts import Projector
from pollen.event import Event

from pollen.data import Queue{Scene} as SceneQueue

module PatternTest4 {
  
  host Event showEvent = new Event(showScene)
  host Event stoppedEvent = new Event(sceneStopped)
  host SceneQueue sceneQ = new SceneQueue(6)
  Scene s = null

//  host Scene scene0 = new Scene(20, SparklePattern.start, null)  
  // host Scene scene1 = new Scene(500, GammaPattern.start, null)
  // host Scene scene2 = new Scene(5000, SinePattern.start, null)

  host Scene scene1 = new Scene(20, SparklePattern.start, null)
  host Scene scene2 = new Scene(20, SparklePattern.start, null)
  host Scene scene3 = new Scene(20, SparklePattern.start, null) 

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    Projector.start()
    sceneQ.add(scene1)
    sceneQ.add(scene2)
    sceneQ.add(scene3)    
    showEvent.post()
    Bijou.run()
  }

  showScene() {
    if (!sceneQ.isEmpty()) {
      s = sceneQ.remove()
      s.setStoppedEvent(stoppedEvent)
      s.start()
    }
  }

  sceneStopped() {
    //sceneQ.add(sineScene)   // re-add the scene

    if (!sceneQ.isEmpty()) {
      showEvent.post()        // post to have it played
    }
  }


}