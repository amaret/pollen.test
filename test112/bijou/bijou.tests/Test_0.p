import pollen.environment as Bijou
from Bijou import ColorLed

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import IndexedPattern as Pattern


module Test_0 {
  
  host Scene s1 = new Scene(60, Pattern.start)

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    Projector.addScene(s1)
    Projector.start()
    Bijou.run()
  }

  // Used for localhost execution
  //pollen.shutdown(uint8 id) {}

}
