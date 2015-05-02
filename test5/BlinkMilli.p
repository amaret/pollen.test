from cc.arduino import Environment as Env
# TEST BlinkMilli.p, error: tries to assign protocol member to protocol

from Env import Led
from Env import GlobalInterrupts
from Env import Mcu 

from pollen.time import TimerMilli

module BlinkMilli {
      
        madams_chkArray() {
          uint8 arr[8]
          uint8 arr2d[8][2]
        }

        toggle() { Led.toggle() }

        pollen.run() {

                TimerMilli.start(toggle, 50, true)
                //Env.GlobalInterrupts.enable()
                //GlobalInterrupts.enable()
                while (true) { } 
        }

        pollen.reset() { 
                Mcu.reset() 
        }

}
