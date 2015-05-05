import pollen.environment as Bijou

from bijou.pattern import SinePattern
from bijou.parts import Scene
from bijou.parts import Projector
from pollen.event import Event

from pollen.data import Queue{Scene} as SceneQueue

module PatternTest2 {
  
  host Event showEvent = new Event(showScene)
  host Event stoppedEvent = new Event(sceneStopped)
  host SceneQueue sceneQ = new SceneQueue(6)
  Scene s = null

  host Scene sineScene = new Scene(1000, SinePattern.start, null)
  host Scene sineScene2 = new Scene(1000, SinePattern.start, null)
  host Scene sineScene3 = new Scene(1000, SinePattern.start, null)
  host Scene sineScene4 = new Scene(1000, SinePattern.start, null)    
  host Scene sineScene5 = new Scene(1000, SinePattern.start, null)    
  host Scene sineScene6 = new Scene(1000, SinePattern.start, null)      

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    Projector.start()
    sceneQ.add(sineScene)
    sceneQ.add(sineScene2)
    sceneQ.add(sineScene3)
    sceneQ.add(sineScene4)
    sceneQ.add(sineScene5)
    sceneQ.add(sineScene6)
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