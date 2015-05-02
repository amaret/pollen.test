package pollen.time

from pollen.interfaces import Handler
from pollen.interfaces import TimerDriver

module TimerMilli {

    host TimerDriver timer
    uint16 count = 0
    uint16 duration = 0
    bool repeat = true
    Handler.handle clientTick

    TimerMilli() {
        TimerDriver.setHandler(timerTick)
    }

    public host bindTimerDriver(TimerDriver td) {
        @timer = td
    }

    public start(Handler.handle h, uint16 duration, bool repeat = true) {
        @clientTick = h
        @count = 0
        @duration = duration
        @repeat = repeat
        TimerDriver.start()
    }

    public stop() {
        TimerDriver.stop()
        @duration = 0
    }

    public bool running() {
        return duration != 0 && TimerDriver.running()
    }


    public timerTick() {
        ++count

        if (count == duration) {
            if (clientTick != null) {
                clientTick()
            }
            count = 0
            if (!repeat) {
                stop()
            }
        }
    }
}
