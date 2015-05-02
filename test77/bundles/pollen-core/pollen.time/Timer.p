from pollen.event import HandlerProtocol as HP
from pollen.event import Event
import TimerManager

class Timer {  

  host Event tickEvent
  bool active = false
  bool periodic = false
  uint16 duration = 0
  uint16 tickCount = 0

  public host Timer(HP.handler h) {   
    tickEvent = new Event(h)
    TimerManager.registerTimerOnHost(@)
  }  

  public start(uint16 ms, bool repeat) {
    @duration = ms
    @periodic = repeat
    @tickCount = 0
    TimerManager.addTimer(@)
    @active = true
  }

  public stop() {      
    @active = false
  }

  public bool isActive() {
    return @active
  }

  public fire() {
    tickEvent.fire()
  }

  public tick() {
    if (@active) {
      @tickCount++
      if (@tickCount == @duration) {
        tickEvent.post()    // cannot do @tickEvent.post() it translates to this->tickEvent.post() instead of func call.

        if (@periodic) {
          @tickCount = 0
        } else {
          @stop()
        }
      }
    }
  }

}

