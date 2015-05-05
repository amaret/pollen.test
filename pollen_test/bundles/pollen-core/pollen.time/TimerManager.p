package pollen.time

from pollen.hardware import HardwareTimerProtocol
import Timer

module TimerManager {

  HardwareTimerProtocol hwTimer     // protocol member for hardware timer driver

  host uint8 numMsTimers = 1
  Timer msTimers[numMsTimers] = {null}
  
  TimerManager() { }

  host TimerManager() {  
    hwTimer.setHandlerOnHost(tickISR)
    numMsTimers = 0
  }

  public host registerTimerOnHost(Timer t) {
    numMsTimers += 1
    print "TimerManager: registering milli timer " + "(total=" + numMsTimers + ")\n"
  }

  public bool addTimer(Timer t) {
    bool added = true
    uint8 i

    for (i = 0; i < numMsTimers; ++i) {
      if (msTimers[i] == null) {
        msTimers[i] = t
        break
      } 
      //elif (msTimers[i] == t) {
       //+{ printf("TimerManager timer 0x%x exists at %d\n", `msTimers`[`i`], `i`) }+
       // break;
      //}
    }

    if (i == numMsTimers) { 
      added = false 
    } elif (TimerManager.isActive() == false) {
      TimerManager.start()    // start the timer manager in case its inactive
    }

    return added
  }

  public start() {
    if (!hwTimer.isRunning()) {
      hwTimer.start()
    }
  }

  public stop() {
    if (hwTimer.isRunning()) {
      hwTimer.stop()
    }
  }

  public bool isActive() {    
    return hwTimer.isRunning()
  }

  /////////////////////////////////////////////////////////
  // Private methods
  /////////////////////////////////////////////////////////

  tickISR() {    
    bool oneActive = false

    for (uint8 i = 0; i < numMsTimers; ++i) {      
      if (msTimers[i] != null) { 
        Timer t = null        
        t = msTimers[i] 

        if (t.isActive()) {
          t.tick() 
          oneActive = true
        }        
      }
    }

    if (!oneActive) {      
     stop()
    }
  }

}