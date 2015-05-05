import pollen.environment as Env
from Env import Led


module BlinkTimer_00 {
  
  host new Timer tickTimer(tick)

  pollen.run() {

    // Setup a timer to periodically trigger a tick every x ms
    tickTimer.start(true, 250)

    // Run the event system
    Events.go()    
  }

  tick() {
    Led.toggle()
  }
}