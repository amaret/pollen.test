package pollen.time 

from pollen.event import HandlerProtocol as HP
from pollen.event import Event
import TimerManager

class Timer {  

  HP.handler() eventHandler = null        // I have to have this here too! If its gone, compile errors!

  host Event tickEvent = null
  bool active = false
  bool periodic = false
  uint16 duration = 0
  uint16 tickCount = 0
  bool added = false

  public host Timer(HP.handler h) {   
    tickEvent = new Event(h)
    TimerManager.registerTimerOnHost(@)
  }  

  public setHandler(HP.handler h) { 
    tickEvent.setHandler(h)     // I use the @ symbol here for some reason! 
  }

  public start(uint16 ms) {
    @duration = ms
    @periodic = true
    @tickCount = 0    
    if (@added == false) {
      TimerManager.addTimer(@)   // add timer to manager and start the manager.
      @added = true
    } else {
      TimerManager.start()      // start the timer just in case its off
    }
    @active = true
  }

  public oneshot(uint16 ms) {
    @duration = ms
    @periodic = false
    @tickCount = 0    
    if (@added == false) {
      TimerManager.addTimer(@)   // add timer to manager and start the manager.
      @added = true
    } else {
      TimerManager.start()      // start the timer just in case its off
    }
    @active = true
  }

  public stop() {      
    @active = false
  }

  public bool isActive() {
    return @active
  }

  public uint16 getDuration() {
    return @duration
  }

  public host uint16 getDurationOnHost() {
    return @duration
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

