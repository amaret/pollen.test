import pollen.environment as Bijou

from Bijou import Led1
from pollen.time import Timer

module TimerTest {
  
  host Timer t = new Timer(toggle)

  toggle() {
    Led1.toggle()
  }

  pollen.reset() {
    Bijou.reset()    
  }

  pollen.run() {
    t.start(250)
    Bijou.run()
  }

}