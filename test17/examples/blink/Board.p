
#from board.arduino import Duemilanove as Hw
from board.ti import LaunchPad as Hw

from Hw import Mcu
from Mcu import GlobalInterrupts
#from Mcu import TimerMilli8BitTimer0 as TD
from Mcu import TimerMilliA0 as TD

from Hw import Led

from pollen.time import Time

composition Board {
	
	# Export composition modules
	export Led
	export Mcu

	host Board() {
		Time.bindGlobalInterrupts(GlobalInterrupts)
		Time.bindTimerDriver(TD)
	}	
}