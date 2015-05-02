package mcu.ti.msp430
 
meta {string part, string dirr, string inr, string outr, uint8 pin}
from pollen.interfaces import Gpio
module GpioMeta implements Gpio {

	# when host members are available do this:
	# host string inc = part + ".h"
	# +{ #include <inc>}+

	+{ #include <msp430g2231.h> }+

	public set() {
		+{`outr`}+ |= (1 << pin)
	}

	public clear() {
		+{`outr`}+ &= ~(1 << pin)
	}
	
	public toggle()	{
		+{`outr`}+ ^= (1 << pin)
	}
	
	public bool get() {
		return +{`inr`}+ & (1 << pin) ? true : false
	}
	
	public makeInput() {
		+{`dirr`}+ &= ~(1 << pin)
	}
	
	public bool isInput() {
		return +{`dirr`}+ & (1 << pin) ? false : true
	}
	
	public makeOutput()	{
		+{`dirr`}+ |= (1 << pin)
	}
	
	public bool isOutput() {
		return +{`dirr`}+ & (1 << pin) ? true : false
	}

}
 
