package cc.arduino

from atmel.atmega328 import Mcu
from atmel.atmega328 import PB5 as D13
from atmel.atmega328 import PB5 as TestPin

composition ArduinoWithoutMeta {

	export Mcu	
	export Mcu.cycle
		
	# Available Digital IO Lines
	export D13
	export TestPin
	export TestPin.set
	export TestPin.clear

	host Arduino() {
		Mcu.setFrequencyOnHost(16000000)
	}
}
