import pollen.environment as Bijou

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import RgbColorWalk as Pattern

from pollen.time import Timer

module Test_3 {
  
  host Scene s1 = new Scene(1000, Pattern.start)

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    Projector.addScene(s1)
    Projector.start()
    Bijou.run()
  }

  pollen.shutdown(uint8 id) {

  }

}
