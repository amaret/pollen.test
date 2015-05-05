
import pollen.environment as Bijou
from Bijou import Led0

from pollen.event import Newsroom
from pollen.event import Event 

from silabs.efm32 import MillisecTimer1
from silabs.efm32 import GlobalInterrupts

from pollen.time import TimerManager
from pollen.time import Timer



module TimerTest5 {

  host Timer t1

  host TimerTest5() {
    Newsroom.GI := GlobalInterrupts
    TimerManager.hwTimer := MillisecTimer1
    t1 = new Timer(tick)
  }

  TimerTest5() {
    Led0.makeOutput()
  }

  tick() {
    Led0.toggle()
  }

  pollen.reset() {
    Bijou.reset()
  }

  pollen.run() {

    t1.start(33, true)

    Newsroom.run()
  }

}