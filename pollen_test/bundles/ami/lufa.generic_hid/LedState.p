
from pollen.event import HandlerProtocol as HP

class LedState {
  
  host HP.handler() onHandler
  host HP.handler() offHandler
  bool isOn

  public host LedState(HP.handler handlerOn, HP.handler handlerOff) {
    @onHandler = handlerOn
    @offHandler = handlerOff
    isOn = false
  }

  public on() {
    onHandler()
    isOn = true
  }

  public off() {
    offHandler()
    isOn = false
  }

  public toggle() {
    if (isOn) { off() }
    else { on() }
  }

}