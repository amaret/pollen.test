package pollen.test

----
Blink using a busy wait 
----

#from distro.ti.launchpad import Distro
from distro.arduino import Distro

from Distro import Mcu
from Distro import Led

module BlinkLed {


    pollen.run() {
        
    	Mcu.reset()

		while (true) {

            Led.toggle()
			Mcu.wait(500000)
		}
	}
}
