package g
//from pollen.environment import BugMod
//from pollen.environment import Mcu
import pollen.environment as Env
//from pollen.environment import BugMod
from Env import BugMod
//from Env import Mcu
# TEST simple pollen.environment, requires -e on command line
# TEST setting pollen.printProtocol in the environment. NO -p. 
# TEST print output - runnable test

from Env import Led
from pollen.time import TimerMilli
import T{Y, true} as TT

module BlinkMilli2 {

        +{ #include <stdlib.h> }+
     
        host toggle() { 
           bool lowValue=true
           TT.get()
        }

        pollen.run() {

           print "In pollen.run()\n"

           Led.toggle() 

           +{ exit(0) }+

        }    
     
        pollen.reset() {  }  
}

