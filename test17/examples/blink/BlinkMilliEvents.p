from cc.arduino import Environment as Env

from Env import Led

from pollen.events import Event{uint8} as Event		# TODO: will eventually be just Event
from pollen.time import TimerMilli

module BlinkMilliEvents {

	value{Event} e

	toggle(Event e) { Led.toggle() }

	tick() { Env.postFromInterrupt(e) }

	pollen.run() {
		e.setHandler(toggle)
		TimerMilli.start(tick, 1000)
		Env.run()
	}
	
	pollen.reset() { Env.reset() }	
	
}