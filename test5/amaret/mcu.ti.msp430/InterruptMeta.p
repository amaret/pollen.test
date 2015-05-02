----

Interrupt meta module for MSP microcontrollers using GCC compiler

----

from pollen.interfaces import Handler
from pollen.interfaces import Interrupt

meta {string part, string vector, string enableRegister, string enableBit, string clearRegister, string clearBit}

module InterruptMeta implements Interrupt {

	# This is all msp430 gcc specific!
	+{ #include <msp430g2231.h> }+
	+{ #include <legacymsp430.h> }+
	
	host string v2 = vector + "_ISR() {"
	
	+{ interrupt (}+
	+{`vector`}+
	+{) }+
	+{`vector` + "_ISR() {"}+	
   	+{ isr() }+
    +{;} }+ 

	public host setHandler(Handler.handle h) { @h = h }
	
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
	//Handler.handle() h
	
	isr() {
		if (h != null) { h() }
	}
}
