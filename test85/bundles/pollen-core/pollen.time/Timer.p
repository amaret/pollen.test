package pollen.time

from pollen.hardware import TimerMilliProtocol

// Need an event reference, using this for now instead
from pollen.hardware import HandlerProtocol

module Timer {

  TimerMilliProtocol hwTimer
  
  uint32 duration = 0
  uint32 elapsed = 0
  bool periodic = true

  //Event tickEvent = null
  HandlerProtocol.handler() tickEventHandler

  Timer() {
    hwTimer.setHandler(tick)
  }

  public start(HandlerProtocol.handler h, uint16 ms, bool repeat) {
    if (!hwTimer.isRunning()) {
      tickEventHandler = h
      periodic = repeat
      duration = ms
      elapsed = 0
      hwTimer.start()
    }
  }

  public stop() {
    if (hwTimer.isRunning()) {
      hwTimer.stop()
    }
  }

  tick() { 
    if (++elapsed == duration) {
      if (periodic == false) {
        hwTimer.stop()
      } else {
        elapsed = 0
      }

      // Post the tickEvent! 
      // For now, call its handler
      if (tickEventHandler != null) {
        tickEventHandler()
      }
    } 
  }

}