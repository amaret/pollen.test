
from pollen.hardware import TimerMilliProtocol
import Timer

// NOTE: Temporary import as bug workaround!
from virtual.mcu import TimerMilli
//from atmel.atmega import TimerMilliTC1 as TimerMilli


module TimerManager {

  TimerMilliProtocol HwTimer     // protocol member for hardware timer driver

  host uint8 numMsTimers = 0
  Timer msTimers[numMsTimers] = {null}
  
  TimerManager() {  }

  host TimerManager() {  
    HwTimer := TimerMilli       // NOTE: Temporary import as bug workaround!
    HwTimer.setHandlerOnHost(tickISR)
    print "in host constr numMsTimers= " + numMsTimers
    //numMsTimers = 0
  }

  public host registerTimerOnHost(Timer t) {
    numMsTimers = numMsTimers + 1
    print "TimerManager registering milli timer (total=" + numMsTimers + ")\n"
  }

  public bool addTimer(Timer t) {
    bool added = true;

    for (uint8 i = 0; i < numMsTimers; ++i) {
      if (msTimers[i] == null) {
        msTimers[i] = t
        break;
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
    if (!HwTimer.isRunning()) {
      HwTimer.start()
    }
  }

  public stop() {
    if (HwTimer.isRunning()) {
      HwTimer.stop()
    }
  }

  public bool isActive() {    
    return HwTimer.isRunning()
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
