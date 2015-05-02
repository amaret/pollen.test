import pollen.environment as Bijou

from bijou.pattern import GammaPattern
from bijou.pattern import SinePattern
from bijou.pattern import SparklePattern
from bijou.parts import Scene
from bijou.parts import Projector
from pollen.event import Event

module PatternTest5 {
  
  host Scene scene0 = new Scene(50, SparklePattern.start)  
  host Scene scene1 = new Scene(50, SparklePattern.start)  
  host Scene scene2 = new Scene(50, SparklePattern.start)  

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {    
    Projector.addScene(scene0)
    Projector.addScene(scene1)
    Projector.addScene(scene2)        
    Projector.start()
    Bijou.run()
  }

 
}