package mcu.atmel.atmega328p

import Atmega328p

import Interrupts
from Interrupts import Timer0MatchA as Interrupt
from pollen.interfaces import Handler
from pollen.interfaces import TimerDriver

module TimerMilli8BitTimer0 implements TimerDriver {

	+{ #include <avr/io.h> }+

	host TimerMilli8BitTimer0() {
	    ticksPerMs = Atmega328p.getSystemFrequency() / (64 * 1000) 		# We need to round this! (math.round?)
	}

	TimerMilli8BitTimer0() {
		+{TCCR0A}+ = TIMER0_MODE_CTC	# Clear Timer on Compare Match Mode
	    +{TCCR0B}+ = TIMER0_STOP       	# Timer off
    	+{OCR0A}+ = ticksPerMs         	# Set to appropriate value to trigger every ms given prescale val    
	}

	#public host setHandler(Handler.handle h = null) {
	#	Interrupt.setHandler(h)
	#}

	public setHandler(Handler.handle h = null) {
		Interrupt.setHandler(h)
	}

	public start() {
	    +{TCNT0}+ = 0;                	# Set timer counter = 0
	    Interrupt.clear()
	    Interrupt.enable()
	    +{TCCR0B}+ = TIMER0_DIV64  # setup pre-scale value & start the timer     
	}

	public stop() {
	    Interrupt.disable()    # disable compare on match interrupt 
    	Interrupt.clear()      # clear any pending interrupts
	    +{TCCR0B}+ = TIMER0_STOP      # stop the timer    
	}

	public bool running() {
	    return +{TCCR0B}+ != 0 && Interrupt.enabled()
	}	
	
	#======================
	# Private members
	#======================
	host uint16 ticksPerMs = 0		# compute ticksPerMs in host initializer

    host uint8 TIMER0_MODE_CTC 	= 0x02  		# these should be const!
    host uint8 TIMER0_STOP 		= 0x00    
    host uint8 TIMER0_DIV1 		= 0x01    
    host uint8 TIMER0_DIV8 		= 0x02
    host uint8 TIMER0_DIV64 	= 0x03
    host uint8 TIMER0_DIV256 	= 0x04    
	
}
