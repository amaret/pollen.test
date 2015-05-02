----

Blink an LED using events and the event dispatcher

----

package pollen.test

from distro.ti.launchpad import Board
from Board import GlobalInterrupts
from Board import Mcu
from Board import Pin
from Board import TimerMilli

from pollen.events import Dispatcher
from pollen.events import Event{uint8} as Event

module EventBlink {

	value{Event} e			# will be: Event e(toggle)

    host EventBlink() {
        Dispatcher.assignGlobalInterrupts(GlobalInterrupts)
    }

	pollen.run() {
		e.setHandler(toggle)
        TimerMilli.start(e, 250, true)
		Dispatcher.run()
	}
	
	toggle(Event e) {
        Pin.toggle()
	}
}