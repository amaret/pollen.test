----

A microsecond busywait delay module

----
package mcu.atmel.atmega328p

from pollen.interfaces import Wait as WaitI

module Wait implements WaitI {

    # host initializer for this module computes a string with the set of
    # nop operations necessary to delay for 1us given the MCU's frequency
    host Wait() {

    }

	public us(uint32 microseconds) {

	    # one loop takes 4-5 cpu cycles
	    # THIS LOOP SHOULD BE GENERATED, GIVEN MCU FREQ,
	    # GENERATE ENOUGH nops SUCH THAT N*NOPS + 4 = (mcuFreq / 1000000)

		for (uint32 i = 0; i < microseconds; i++) {
	        +{ asm("nop") }+
	        +{ asm("nop") }+
	        +{ asm("nop") }+
	        +{ asm("nop") }+
	        +{ asm("nop") }+
	        +{ asm("nop") }+
	        +{ asm("nop") }+
	        +{ asm("nop") }+
	        +{ asm("nop") }+
	        +{ asm("nop") }+
	        +{ asm("nop") }+
		}
	}
}