package mcu.atmel.atmega328p.test

from distro.arduino import Board
from Board import Mcu
from Board import Pin0
from Mcu import GlobalInterrupts
from mcu.atmel.atmega328p import TimerMilli8BitTimer0 as Timer

module TimerInterruptTest {

	uint16 count = 0

	#host TimerInterruptTest() {
	#	Timer.setHandler(blink)
	#}
	
	pollen.run() {
		Mcu.reset()
		Timer.setHandler(blink)
		Pin0.makeOutput()
		Timer.start()
		GlobalInterrupts.enable()
		while (true) { }
	}

	blink() {
		if (++count == 75) {
			Pin0.toggle()
			count = 0
		}
	}
}