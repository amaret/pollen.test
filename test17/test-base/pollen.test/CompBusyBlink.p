----

Blink an LED using events and the event dispatcher

----

package pollen.test

from distro.ti.launchpad import Distro
from Distro import Mcu
from Distro import Pin
from Distro import Wait

from pollen.events import Event{uint8} as Event

module CompBusyBlink {

	pollen.run() {
        Mcu.reset()
        Pin.clear()
        Pin.makeOutput()
        
        while (true) {
            Pin.toggle()
            Wait.us(50000)
        }
	}
}