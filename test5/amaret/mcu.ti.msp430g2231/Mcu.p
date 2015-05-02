package mcu.ti.msp430g2231

import Msp430g2231
from mcu.ti.msp430 import GlobalInterrupts
from mcu.ti.msp430 import TimerMilliA0

from mcu.ti.msp430 import GpioMeta{"msp430g2231.h", "P1DIR", "P1IN", "P1OUT", 0} as P1_0
#from mcu.ti.msp430 import GpioMeta{"msp430g2231.h", "P1DIR", "P1IN", "P1OUT", 1} as P1_1
#from mcu.ti.msp430 import GpioMeta{"msp430g2231.h", "P1DIR", "P1IN", "P1OUT", 2} as P1_2
#from mcu.ti.msp430 import GpioMeta{"msp430g2231.h", "P1DIR", "P1IN", "P1OUT", 3} as P1_3
#from mcu.ti.msp430 import GpioMeta{"msp430g2231.h", "P1DIR", "P1IN", "P1OUT", 4} as P1_4
#from mcu.ti.msp430 import GpioMeta{"msp430g2231.h", "P1DIR", "P1IN", "P1OUT", 5} as P1_5
from mcu.ti.msp430 import GpioMeta{"msp430g2231.h", "P1DIR", "P1IN", "P1OUT", 6} as P1_6
#from mcu.ti.msp430 import GpioMeta{"msp430g2231.h", "P1DIR", "P1IN", "P1OUT", 7} as P1_7


composition Mcu { 	# implements pollen.interfaces.Mcu

	#=========================
	# Mcu Methods
	#=========================

	export Msp430g2231.reset
	export Msp430g2231.shutdown
	export Msp430g2231.wait
	export Msp430g2231.nop

	#=========================	
	# Mcu Modules
	#=========================
		
	export GlobalInterrupts
	export TimerMilliA0

	# Gpio Port P1
	export P1_0
	#export P1_1
	#export P1_2
	#export P1_3
	#export P1_4
	#export P1_5
	export P1_6
	#export P1_7
}