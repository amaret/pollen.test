package pollen.time

from pollen.events import Events
from pollen.events import Event{uint8} as Event

import TimerManager

type Timer {

	Timer() {
		active = repeat = 0
	}
	
	public start(Event e, uint32 duration, bool repeat = true) {
		@e = e
		@duration = duration
		@repeat = repeat
		@active = true
		
		
	}
	
	public stop() {
		@active = false
	}
	
	public tick() {
		if (active == true) {
			# assert (elapsed < duration)
			elapsed++
			
			if (elapsed == duration) {
				if (e != 0) {
					Events.post(e)
				}
				
				if (repeat == true) {
					elapsed = 0
				} else {
					stop()
				}
			}
		}
	}

	public bool running() { return @active }

	#======================
	# Private members
	#======================
	Event e
	uint32 duration
	uint32 elapsed
	bool repeat
	bool active
}