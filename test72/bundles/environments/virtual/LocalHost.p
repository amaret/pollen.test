
from virtual.mcu import Mcu 
from virtual.mcu import ConsolePrint as Print 
from pollen.event import Dispatcher

composition LocalHost extends Mcu {

  host LocalHost() {
    Dispatcher.GI := Mcu.GlobalInterrupts
  }

  export Dispatcher.run
  export Dispatcher.post
  export Dispatcher.postFromInterrupt
  export Print

}