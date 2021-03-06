----
	Interrupt meta module for AVR microcontrollers*
	
	*This module is GCC specific
----

from pollen.interfaces import Handler
from pollen.interfaces import Interrupt

meta {string name, string enableRegister, string enableBit, string clearRegister, string clearBit}

module InterruptMeta implements Interrupt {

	+{ #include <avr/io.h> }+
	+{ #include <avr/interrupt.h> }+
	
	+{ ISR( }+
	+{`name`}+
	+{ ) { }+
    	+{isr()}+
    +{;} }+ 

	#public host setHandler(Handler.handle h) { @h = h }
	
	public setHandler(Handler.handle h) { @h = h }

	public enable() {
		+{`enableRegister`}+ |= (1 << +{`enableBit`}+)
	}

	public bool enabled() {
		return +{`enableRegister`}+ & (1 << +{`enableBit`}+)
	}

	public disable() {
		+{`enableRegister`}+ &= ~(1 << +{`enableBit`}+)
	}

	public clear() {
		+{`clearRegister`}+ &= ~(1 << +{`clearBit`}+)
	}
	
	#====================
	# Private members
	#====================
	Handler.handle h = 0
	
	isr() {
		if (h != null) { h() }
	}
}
