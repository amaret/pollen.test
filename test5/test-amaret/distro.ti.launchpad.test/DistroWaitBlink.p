from distro.ti.launchpad import Distro
from Distro import Mcu
from Distro import Pin0

module DistroWaitBlink {

	pollen.run() {
		Mcu.reset()
		Pin0.makeOutput()
		
		while(true) {
			Pin0.toggle()
			Mcu.wait(50000)
		}
	}
}