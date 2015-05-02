from pollen.event import HandlerProtocol as HP

module Timer {  

  // IDEA: can also have classes Second and Micro for second and microsecond timers

  class Milli {

    host HP.handler() tick = null
    bool active = false
    bool periodic = false
    uint16 duration = 0
    uint16 tickCount = 0

    public host Milli(HP.handler h) {
      @tick = h
    }

  }




  host uint8 NumMilliTimers = 0
  host TimerMilli milliTimers[NumMilliTimers] = {null}



}