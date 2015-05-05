import pollen.environment as Bijou

from bijou.pattern import SinePattern
from bijou.parts import Scene
from bijou.parts import Projector
from pollen.event import Event

from pollen.data import Queue{Scene} as SceneQueue

module PatternTest1 {
  
  host Event e = new Event(restartScene)
  host Scene s = new Scene(1000, SinePattern.start, null)
  host SceneQueue sceneQ = new SceneQueue(5)

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    Projector.start()

    s.setStoppedEvent(e)
    s.start()
    Bijou.run()
  }

  restartScene() {
    s.start()
  }

}