package pollen.interfaces

!----

----!

from pollen.events import Event{any} as Event

protocol Timer {

	bool repeats()
    bool running()
    uint16 ticksPerSecond()

    start(Event onTick, uint16 duration, bool repeat = true)
    stop() 
}
