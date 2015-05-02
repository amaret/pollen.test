----

Blink an LED using events and the event dispatcher

----

package pollen.test

from distro.ti.launchpad import Distro
from Distro import Mcu
from Distro import Pin
from Distro import TimerMilli

from pollen.events import Events
from pollen.events import Event{uint8} as Event

module EventBlink {

	value{Event} e			# will be: Event e(toggle) or Events.createEvent()

    pollen.reset() {
        Mcu.reset()
        Pin.makeOutput()
        Pin.clear()
		e.setHandler(toggle)
    }

	pollen.run() {
        TimerMilli.start(e, 250, true)
		Dispatcher.run()
	}
	
	toggle(Event e) {
        Pin.toggle()
	}

}