
from pollen.hardware import TimerMilliProtocol
import Timer

// NOTE: Temporary import as bug workaround!
from virtual.mcu import TimerMilli


module TimerManager {

  TimerMilliProtocol HwTimer     // protocol member for hardware timer driver

  host uint8 numMsTimers = 1
  Timer msTimers[numMsTimers] = {null}

  host bool firstTimer = true
  
  TimerManager() {  }

  host TimerManager() {  
    HwTimer := TimerMilli       // NOTE: Temporary import as bug workaround!
    HwTimer.setHandlerOnHost(tickISR)

    if (firstTimer == true) {
      numMsTimers = 0
      firstTimer = false
    }

    print "TimerManager constructor # timers = " + numMsTimers + "\n"    

  }

  public host registerTimerOnHost(Timer t) {
    msTimers[numMsTimers++] = t    
    print "TimerManager registering milli timer t= (total=" + numMsTimers + ")\n"
  }

  public bool addTimer(Timer t) {
    bool added = true;

    +{ printf("TimerManager trying to add timer 0x%x\n", `t`) }+

    for (uint8 i = 0; i < numMsTimers; ++i) {
      if (msTimers[i] == null) {
        msTimers[i] = t
       +{ printf("TimerManager added timer 0x%x at %d\n", `msTimers`[`i`], `i`) }+
        break;
      } //elif (msTimers[i] == t) {
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
    +{ printf("TimerManager start\n") }+
    if (!HwTimer.isRunning()) {
      HwTimer.start()
    }
  }

  public stop() {
    if (HwTimer.isRunning()) {
      +{ printf("TimerManager stop\n") }+
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
      +{ printf("TimerManager no timers active!\n") }+ 
      stop()
    }
  }

}