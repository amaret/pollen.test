from mcu.ti.msp430g2231 import Mcu
from Mcu import P1_0 as Pin
from Mcu import GlobalInterrupts as GI

from mcu.ti.msp430 import TimerMilliA0 as TA0

module TimerMilliA0Test {

	uint32 counter = 0

	TimerMilliA0Test() {
		Mcu.reset()
		TA0.setHandler(handleISR)
		Pin.clear()
		Pin.makeOutput()
	}

	pollen.run() {
		TA0.start()
		GI.enable()
		while(true) { }		
	}
	
	handleISR() {
		if (counter++ == 500) {
			Pin.toggle()
			counter = 0
		}
	}
}