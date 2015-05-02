from pollen.event import HandlerProtocol as HP
from pollen.event import Event
import TimerManager

class Timer {  

  host new Event tickEvent()
  bool active = false
  bool periodic = false
  uint16 duration = 0
  uint16 tickCount = 0

  public host Timer(HP.handler h) {   
    print "host new Timer\n"
    tickEvent.setHandlerOnHost(h)
    print "host timer tickEvent: " + tickEvent + "handler: " + h + "\n"
    TimerManager.registerTimerOnHost(@)
  }  

  public Event getEvent() {
    return @tickEvent
  }

  public HP.handler getHandler() {
    return tickEvent.getHandler()
  }

  public startup(HP.handler handler) {
    +{ printf("tickEvent addr=0x%x\n", this->tickEvent) }+
    +{ printf("tickEventHandler addr=0x%x sizeof=%d\n", this->tickEvent, sizeof(this->tickEvent)) }+
    //tickEvent.fire()
  }

  public start(uint16 ms, bool repeat) {
    +{ printf("Timer class start 0x%x, event = 0x%x\n", this, this->tickEvent) }+
    @duration = ms
    @periodic = repeat
    @tickCount = 0
    TimerManager.addTimer(@)
    @active = true
  }

  public stop() {      
    @active = false
  +{ printf("Timer class stop 0x%x\n", this) }+
  }

  public bool isActive() {
    return @active
  }

  public fire() {
    tickEvent.fire()
  }

  public tick() {
    +{ printf("Timer class tick 0x%x\n", this) }+
    if (@active) {
      @tickCount++
      if (@tickCount == @duration) {
        if (@tickEvent != null) {
         +{ printf("Timer class posting count=%d dur=%d\n", `tickCount`, `duration`) }+
          tickEvent.post()
        }

        if (@periodic) {
          @tickCount = 0
        } else {
          @stop()
        }
      }
    }
  }

}

