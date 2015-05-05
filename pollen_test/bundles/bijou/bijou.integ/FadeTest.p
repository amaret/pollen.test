import pollen.environment as Bijou

from Bijou import ColorLed

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import CrossFade
from pollen.event import Event


module FadeTest {
 
  host Event e1 = new Event(requeue)
  host Scene s1 = new Scene(100, CrossFade.start, CrossFade.stop)

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    ColorLed.setRGBA(255, 255, 255, 255)
    CrossFade.fadeTo(255, 50, 0, 255)
    Projector.addScene(s1)
    Projector.start(e1)
    Bijou.run()
  }

  requeue() {
    //ColorLed.setRGBA(255, 255, 255, 255)
    //Projector.addScene(s1)
  }
}
