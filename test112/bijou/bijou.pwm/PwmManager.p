
import PwmChannel

from silabs.efm32 import MicrosecTimer0 as Timer

module PwmManager {
  
  host uint8 PwmFrequencyKHZ = 50
  host uint8 PwmSteps = 255

  host uint8 capacity = 0
  PwmChannel channels[capacity] = {null}
  uint8 numChannels = 0

  bool enabled = false


  host PwmManager() {
    uint16 duration = 1000000 / (PwmFrequencyKHZ * PwmSteps)
//    print "PWM Timer duration = " + duration + "us\n"
    Timer.configureOnHost(duration, pwmManagerHandler, true)    // 78us timer, repeating
  }

  public host uint8 getPwmResolutionOnHost() { 
    return PwmSteps
  }

  public host registerChannel() {
    capacity = capacity + 1
//    print "PWM channel registered. Num Channels = " + capacity + "\n"
  }

  public bool addChannel(PwmChannel c) {          
    if (numChannels < capacity) {
      channels[numChannels] = c
      numChannels++      
      return true
    }
    return false
  }

  public start() {    
    if (!enabled) {            
      Timer.start()
      enabled = true
    }    
  }

  public stop() {
    if (enabled) {
      Timer.stop()
      enabled = false
    }
  }

  //-----------------------------------------------------------------------
  // Main interrupt handler for the PWM Manager 
  //-----------------------------------------------------------------------
  pwmManagerHandler() {
    for (uint8 i = 0; i < numChannels; i++) {
      PwmChannel c = channels[i]
      if (c.isOn()) {  
        c.tick()
      }
    }
  }

}