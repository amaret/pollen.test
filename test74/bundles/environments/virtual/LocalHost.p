
from virtual.mcu import Mcu 
from virtual.mcu import TimerMilli
from virtual.mcu import GlobalInterrupts
from virtual.mcu import ConsolePrint as Print 

from pollen.event import Newsroom
//from pollen.time import TimerManager

composition LocalHost extends Mcu {

  preset LocalHost() {
    Newsroom.GI := GlobalInterrupts
    //TimerManager.HwTimer := TimerMilli
  }

  export Mcu
  export TimerMilli
  export GlobalInterrupts
  export Newsroom
  export Print


}