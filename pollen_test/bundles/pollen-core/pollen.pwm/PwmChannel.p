from pollen.event import HandlerProtocol as HP
from pollen.event import Event

class PwmChannel {
  
  bool active = false;
  uint16 duty = 0;
  uint16 dutyBuf = 0
  uint16 tickCount = 0

  host Event onHighEvent
  host Event onLowEvent

  public host PwmChannel(HP.handler onHigh, HP.handler onLow) {
    @onHighEvent = new Event(onHigh)
    @onLowEvent = new Event(onLow)
  }

  public host setHandlersOnHost(HP.handler onHigh, HP.handler onLow) {
    @onHighEvent.setHandlerOnHost(onHigh)
    @onLowEvent.setHandlerOnHost(onLow)
  }

  public setHandlers(HP.handler onHigh, HP.handler onLow) {
    @onHighEvent.setHandler(onHigh)
    @onLowEvent.setHandler(onLow)
  }

  public tick() {

    if (!active) { return }

    // update the duty cycle only at the beginning of a cycle
    if (tickCount == 0) {
      @duty = @dutyBuf
      onHighEvent.post()
    }

    @tickCount++
    if (tickCount == duty) {
      onLowEvent.post()
    }
  }

}