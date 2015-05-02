import pollen.environment as Bijou

from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import IndexedPattern as Pattern

from pollen.time import Timer

module Test_2 {
  
  host Timer t = new Timer(requeue)

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

  requeue() {
    Projector.addScene(s1)
    Projector.addScene(s2)
    Projector.addScene(s3)
    Projector.addScene(s4)
    Projector.addScene(s5)
    Projector.addScene(s6)
    Projector.addScene(s7)
  }

  pollen.run() {
    requeue()
    t.start(2000)
    Projector.start()
    Bijou.run()
  }

}