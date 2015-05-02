
from virtual.mcu import Mcu 
from virtual.mcu import GlobalInterrupts
from virtual.mcu import ConsolePrint as Print 
from pollen.event import Newsroom

composition LocalHost extends Mcu {

  host LocalHost() {
    Newsroom.GI := GlobalInterrupts
  }

  export Mcu
  export GlobalInterrupts
  export Newsroom
  export Print


}