from pollen.hardware import HandlerProtocol
import PwmManager

class PwmChannel {
  
  HandlerProtocol.handler() onHandler
  HandlerProtocol.handler() offHandler

  host uint8 dutyMAX = 0
  uint8 duty = 0
  uint8 newDuty = 0
  uint8 dutyCount = 0
  bool on = false
  bool added = false

  uint16 counter = 0

  public host PwmChannel(HandlerProtocol.handler onIsr, HandlerProtocol.handler offIsr) {
    @onHandler = onIsr
    @offHandler = offIsr
    @dutyMAX = PwmManager.getPwmResolutionOnHost()
    PwmManager.registerChannel()
  }

  public start(uint8 duty) {
    @duty = @newDuty = duty
    @dutyCount = 0

    if (@added == false) { 
      @added = PwmManager.addChannel(@) 
    }
    @on = true 
    PwmManager.start()
  }

  public stop() {
    @on = false
  }

  public bool isOn() {
    return @on
  }

  public setDuty(uint8 duty) {    
    if (duty <= @dutyMAX) {
      @newDuty = duty
    }
  }

  public tick() {
    if (@dutyCount == 0 && @duty > 0) { onHandler() }   // on condition
    @dutyCount++
    if (@dutyCount == duty) { offHandler() }           // off condition
    if (@dutyCount == @dutyMAX) {                     // end of period
      @dutyCount = 0 
      if (@newDuty != @duty) { 
        @duty = @newDuty 
      }
    }
  }       

}