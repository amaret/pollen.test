import pollen.environment as Bijou
from Bijou import ColorLed

from pollen.event import Event
from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import RgbColorWalk as Pattern

module Test_0 {
  
  host Scene s1 = new Scene(20000, Pattern.start, Pattern.stop)
  host Event e1 = new Event(restart)

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    Projector.start(e1)
    Projector.addScene(s1)
    Bijou.run()
  }

  restart() {
    Projector.addScene(s1)
  }
}