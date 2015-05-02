----

Composition representing the configuration / layout of what's available from an ATMega328p

----

package mcu.atmel.atmega328p

import Atmega328p
import GlobalInterrupts
import Interrupts
#import I2C
import TimerMilli8BitTimer0
import Uart

import GpioMeta {"PORTB", "DDRB", 3} as PB3
import GpioMeta {"PORTB", "DDRB", 4} as PB4
import GpioMeta {"PORTB", "DDRB", 5} as PB5

#import GpioMeta {"PORTC", "DDRC", 4} as PC4
#import GpioMeta {"PORTC", "DDRC", 5} as PC5
#import GpioMeta {"PORTD", "DDRD", 0} as PD0
#import GpioMeta {"PORTD", "DDRD", 1} as PD1
#import GpioMeta {"PORTD", "DDRD", 2} as PD2
#import GpioMeta {"PORTD", "DDRD", 3} as PD3
#import GpioMeta {"PORTD", "DDRD", 4} as PD4
#import GpioMeta {"PORTD", "DDRD", 5} as PD5
#import GpioMeta {"PORTD", "DDRD", 6} as PD6
#import GpioMeta {"PORTD", "DDRD", 7} as PD7

composition Mcu {

	#=========================
	# Mcu Methods
	#=========================

	export Atmega328p.reset
	export Atmega328p.shutdown
	export Atmega328p.wait
	export Atmega328p.nop
	#export Atmega328p.getSystemFrequency	# These lines give an error: 
	#export Atmega328p.setSystemFrequency	# "ambiguous function: getSystemFrequency"

	public host uint32 getSystemFrequency() { return Atmega328p.getSystemFrequency() }
	public host setSystemFrequency(uint32 hz) { Atmega328p.setSystemFrequency(hz) }
	
	#=========================	
	# Mcu Modules
	#=========================
	export GlobalInterrupts
	#export I2C
	export Interrupts
	export TimerMilli8BitTimer0
	export Uart
	
	# Gpio Pins
    export PB3
    export PB4
    export PB5
	
}

