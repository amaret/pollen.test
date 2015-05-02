import pollen.environment as Bijou

# TEST error test. 
# TEST In Button.p, fcn 'pressHandler(uint32 pin)'
# TEST call 'pin.get()' should get an invalid qualifier
# TEST as qualiier has scalar type.


from bijou.parts import Projector
from bijou.parts import Scene
from bijou.pattern import RgbColorWalk
from bijou.pattern import StillColorPattern

from pollen.event import Event
from pollen.time import Timer

module Test_4 {
  
  host Event e1 = new Event(requeue)
  host Scene s1 = new Scene(11000, RgbColorWalk.start)
  host Scene s2 = new Scene(2000, StillColorPattern.start)
  
  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {
    StillColorPattern.setColorRGB(0, 0, 0)
    requeue()
    Projector.start(e1)
    Bijou.run()
  }  

  requeue(){    
    Projector.addScene(s1)
    Projector.addScene(s2)
  }


  // Here for when run on the host...
  //pollen.shutdown(uint8 id) {}

}
