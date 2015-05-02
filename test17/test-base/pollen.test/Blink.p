package pollen.test

----
Blink using a busy wait 
----

from distro.ti.launchpad import Board
#from distro.arduino import Board

from Board import Mcu
from Board import Pin0 as Pin

module Blink {


	pollen.run() {
        
		Mcu.reset()
		Pin.clear()
		Pin.makeOutput()

		while (true) {
			Pin.toggle()
			Mcu.wait(500000)
		}
	}
}
