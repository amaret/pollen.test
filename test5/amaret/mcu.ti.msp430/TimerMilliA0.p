package mcu.ti.msp430

----

This module implements a millisecond timer using hardware timer A0.

----

from pollen.interfaces import TimerDriver
from pollen.interfaces import Handler
import TimerA0Interrupt as Interrupt

module TimerMilliA0 implements TimerDriver {

	+{ #include <msp430g2231.h> }+

	host uint16 ticksPerMs = 1000	# compute ticksPerMs in host initializer

	TimerMilliA0() {
		+{TACTL = TASSEL_2 + MC_0}+  # Timer using SMCLK, set to off      
	    +{TACCR0}+ = ticksPerMs      # Count to 10K, @1MHZ thats 1ms.
	}

	#public host setHandler(Handler.handle h = null) {
	#	Interrupt.setHandler(h)
	#}

	public setHandler(Handler.handle h = null) {
		Interrupt.setHandler(h)
	}

	public start() {
		+{TAR}+ = 0
		Interrupt.clear()
		Interrupt.enable()
		+{TACTL |= MC_1}+         	 # Timer on in Up Mode
	}

	public stop() {
	    Interrupt.disable()
    	Interrupt.clear()
		uint16 mask = ~(3 << 4) +{;}+
	    +{TACTL}+ &= mask    
	}

	public bool running() {
	    return (+{TACTL & MC_1}+ && Interrupt.enabled()) ? true : false
	}
}