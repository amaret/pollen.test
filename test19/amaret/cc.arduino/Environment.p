package cc.arduino

import Duemilanove as Board
from Board import Led
from Board import Mcu
from Board import BugMod
import PrintImpl
#from Mcu import GlobalInterrupts

composition Environment {       # This should extend Board when composition inheritance exits!

        export Led
        export Mcu
        export BugMod
  host Environment() {
        pollen.printProtocol := PrintImpl
  } 
}
