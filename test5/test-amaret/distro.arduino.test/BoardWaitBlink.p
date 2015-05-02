from distro.arduino import Board
from Board import Mcu
from Board import Pin0

module BoardWaitBlink {

	pollen.run() {
		Mcu.reset()
		Pin0.makeOutput()
		
		while(true) {
			Pin0.toggle()
			Mcu.wait(50000)
		}
	}
}