
from distro.arduino import Distro
from Distro import Mcu

from pollen.time import TimerManager

module TimerManagerTest {

	value{TimerManager.Timer} t

	host TimerManagerTest() {
		t.init()
	}

	pollen.run() {
		Mcu.reset()		

		while(true) {
		
		}
	}
}