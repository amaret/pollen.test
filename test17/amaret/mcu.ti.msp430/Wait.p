----

A microsecond busywait delay module

----
package mcu.ti.msp430

from pollen.interfaces import Wait as WaitI

module Wait implements WaitI {

    # host initializer for this module should compute a string with the set of
    # nop operations necessary to delay for 1us given the MCU's frequency
    # host Wait() {}

	public us(uint32 microseconds) {
		volatile uint32 t

	    # once upon a time it was measured that for more than one 
    	# iteration of the loop it takes about 7 cycles per iteration.  		
		for (uint32 i = 0; i < (microseconds / 10) + 1; i++) {
			t = 0
		}
	}
}