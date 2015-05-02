package mcu.atmel.atmega328p

from mcu.atmel.atmega import InterruptMeta{"TIMER0_COMPA_vect", "TIMSK0", "OCIE0A", "TIFR0", "OCF0A"} as Timer0MatchA

composition Interrupts {

	export Timer0MatchA
	
}