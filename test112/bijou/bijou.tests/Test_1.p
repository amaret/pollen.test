import pollen.environment as Bijou

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import IndexedPattern as Pattern

module Test_1 {
  
  host Scene s1 = new Scene(60, Pattern.start)
  host Scene s2 = new Scene(600, Pattern.start)
  host Scene s3 = new Scene(60, Pattern.start)
  host Scene s4 = new Scene(60, Pattern.start)
  host Scene s5 = new Scene(100, Pattern.start)
  host Scene s6 = new Scene(400, Pattern.start)
  host Scene s7 = new Scene(50, Pattern.start)

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    Projector.addScene(s1)
    Projector.addScene(s2)
    Projector.addScene(s3)
    Projector.addScene(s4)
    Projector.addScene(s5)
    Projector.addScene(s6)
    Projector.addScene(s7)
    Projector.start()
    Bijou.run()
  }

}