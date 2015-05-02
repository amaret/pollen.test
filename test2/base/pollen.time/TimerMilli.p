package pollen.time

module TimerMilli {

	uint16 count = 0
	uint16 duration = 0
	bool repeat = true


    public start(uint16 duration, bool repeat = true) {
		@count = 0
		@duration = duration
		@repeat = repeat
    }
}
