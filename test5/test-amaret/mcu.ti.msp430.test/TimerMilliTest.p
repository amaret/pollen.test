----

TimerMilliTest

----

package mcu.ti.msp430g2231.test	

from mcu.ti.msp430g2231.McuLayout import GlobalInterrupts
from mcu.ti.msp430g2231.McuLayout import Mcu
from mcu.ti.msp430g2231.McuLayout import P1_0 as Pin
from mcu.ti.msp430 import TimerMilli

from pollen.events import Events
from pollen.events import Event{uint8} as Event


module TimerMilliTest {

	value{Event} e

    host TimerMilliTest() {
        Events.assignGlobalInterrupts(GlobalInterrupts)
    }

	TimerMilliTest() {
		Mcu.reset()
		e.setHandler(tick)
		Pin.clear()
		Pin.makeOutput()
	}

	pollen.run() {
		TimerMilli.start(e, 25, true)
		Events.run()
	}
			
	tick(Event t) {
		Pin.toggle()
	}
}