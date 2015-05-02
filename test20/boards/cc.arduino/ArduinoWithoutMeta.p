package cc.arduino

from mcu.atmel.atmega328p import Mcu
from mcu.atmel.atmega328p import PD0 as D1
from mcu.atmel.atmega328p import PD0 as TestPin

composition ArduinoWithoutMeta {

	export Mcu	
	export Mcu.cycle
		
	# Available Digital IO Lines
	export D1
	export TestPin

	host Arduino() {
		Mcu.setFrequencyOnHost(16000000)
	}
}
