package mcu.atmel.atmega328p

//from pollen.interfaces import GlobalInterrupts as GI

module GlobalInterrupts { //implements GI {

    +{ #include <avr/io.h>
       #include <avr/interrupt.h> }+

	public uint16 disable() {
    	uint16 key = +{SREG}+ & (1 << 7)
	    +{cli()}+
	    return key
	}

	public enable() {
    	+{sei()}+
	}
    
	public restore(bool f) {
        // ERROR in implements, key must be bool
        uint16 key = 1
    	if (key != 0) {
        	+{sei()}+
	    }
	    else {
    	    +{cli()}+
	    }
	}    
}
