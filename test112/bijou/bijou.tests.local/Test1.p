import pollen.environment as Env

from Env import Led0
from Env import Led1
from Env import Led2
from pollen.time import Timer
from pollen.event import Event

module Test1 {
  
  host Timer tickTimer = new Timer(tick)
  host Timer dbTimer = new Timer(debounce)
  host Event event1 = new Event(handler)

  host uint8 pressDebounce = 10

  pollen.reset() {
    Env.reset()
  }

  pollen.run() {

//    print "Start ticks...\n"    
    tickTimer.start(250, true)
    Env.run()
  }

  tick() {
//    print "Timer Tick, debouncing...\n"
    Led0.on()
    dbTimer.start(pressDebounce, false)
  }

  debounce() {
//    print "Timer debounced, posting...\n"
    Led1.on()
    event1.post()
  }

  handler() {
//    print "Event Handler...\n"
    //Led2.on()
    Led2.toggle()

  }

  pollen.shutdown(uint8 id) {

  }
}
