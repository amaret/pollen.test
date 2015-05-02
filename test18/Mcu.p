----

Composition representing the configuration / layout of what's available from an ATMega328p

----


import Atmega328p
import GlobalInterrupts

composition Mcu {

	#=========================
	# Mcu Methods
	#=========================

	export Atmega328p.reset
	public host uint32 getSystemFrequency() { return Atmega328p.getSystemFrequency() }
	public host setSystemFrequency(uint32 hz) { Atmega328p.setSystemFrequency(hz) }
	
	#=========================	
	# Mcu Modules
	#=========================
	export GlobalInterrupts
	
}

