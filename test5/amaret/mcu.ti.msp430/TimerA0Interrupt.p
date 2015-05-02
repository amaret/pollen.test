package mcu.ti.msp430

from pollen.interfaces import Interrupt
from pollen.interfaces import Handler

module TimerA0Interrupt implements Interrupt {

	Handler.handle h
	
	# This is all msp430 gcc specific!
	+{ #include <msp430g2231.h> }+
	+{ #include <legacymsp430.h> }+

	+{ interrupt (TIMERA0_VECTOR) TimerA0Interrupt_ISR() { }+
    	+{isr()}+
    +{;} }+ 

	public host setHandler(Handler.handle h) { @h = h }
	
	public setHandler(Handler.handle h) { @h = h }
	
	public enable() {
		+{TACCTL0}+ |= (1 << 4)
	}

	public bool enabled() {
		return +{TACCTL0}+ & (1 << 4) ? true : false
	}

	public disable() {
		+{TACCTL0}+ &= ~(1 << 4)	
	}

	public clear() {
		+{TACCTL0}+ &= ~(1 << 0)
	}
	
	isr() {
		if (h != null) { h() }
	}
}