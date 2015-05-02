package mcu.ti.msp430

from pollen.interfaces import Timer as TimerI
from pollen.events import Events
from pollen.events import Event{uint8} as Event
import TimerMilliA0 as TA0

module TimerMilli implements TimerI {

	Event event
	uint16 duration
	uint16 current
	bool repeat
	
	# host TimerMilli() {} 	# can't call host functions from there yet

	TimerMilli() {
		TA0.setHandler(timerInterrupt)
	}
	
    public start(Event onTick, uint16 duration, bool repeat = true) {
    	@event = onTick; 
    	@duration = duration; 
    	@repeat = repeat; 
    	@current = 0    	
    	TA0.start()
    }
    
    public stop() {
		TA0.stop()    
    }

	public bool periodic() { return repeat }

    public bool running() { return TA0.running() }

    public uint16 ticksPerSecond() { return 1000 }
    
    timerInterrupt() {
		if (++current == duration) {			
	    	if (repeat == true) {
	    		current = 0
	    	} else {
	    		TA0.stop()
	    	}
	    	
	    	if (event != 0) {
	    		Events.postFromInterrupt(event)
    		}    	
		}

    }
}