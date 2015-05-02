package cc.arduino

import Duemilanove as Board
from Board import Led
from Board import Mcu
from Mcu import GlobalInterrupts
from Mcu import TimerMilli8BitTimer0 as TD

from pollen.time import Time
from pollen.events import Events

composition Environment {	# This should extend Board when composition inheritance exits!

	export GlobalInterrupts
	export Led
	export Mcu
	//export Mcu.reset
	//export Mcu.wait
	export Events.run
	export Events.post
	export Events.postFromInterrupt	
	
	host Environment() {
		Events.bindGlobalInterrupts(GlobalInterrupts)
		Time.bindGlobalInterrupts(GlobalInterrupts)
		Time.bindTimerDriver(TD)
	}
}
