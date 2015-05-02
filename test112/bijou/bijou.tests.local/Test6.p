import pollen.environment as Bijou

from bijou.parts import Scene
from bijou.parts import Projector
from bijou.pattern import SparklePattern

module Test6 {

  host Scene scene0 = new Scene(20, SparklePattern.start)
  host Scene scene1 = new Scene(50, SparklePattern.start)
  host Scene scene2 = new Scene(100, SparklePattern.start)
  host Scene scene3 = new Scene(200, SparklePattern.start)
  host Scene scene4 = new Scene(100, SparklePattern.start)
  host Scene scene5 = new Scene(50, SparklePattern.start)

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    Projector.addScene(scene0)
    Projector.addScene(scene1)    
    Projector.addScene(scene2)
    Projector.addScene(scene3)
    Projector.addScene(scene4)
    Projector.addScene(scene5)
    Projector.start()
    Bijou.run()
  }

  pollen.shutdown(uint8 id) {

  }

}
