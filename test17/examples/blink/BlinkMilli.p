from cc.arduino import Environment as Env

from Env import Led
from pollen.time import TimerMilli

module BlinkMilli {
      
        madams_chkArray() {
          uint8 arr[8]
          uint8 arr2d[8][2]
        }

	toggle() { Led.toggle() }

	pollen.run() {

		TimerMilli.start(toggle, 50)
		Env.GlobalInterrupts.enable()		
		while (true) { } 
	}
	
	pollen.reset() { Env.reset() }	
	
}
