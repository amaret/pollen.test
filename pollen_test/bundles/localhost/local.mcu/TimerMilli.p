package local.mcu

from pollen.event import HandlerProtocol as HP
from pollen.hardware import HardwareTimerProtocol

module TimerMilli implements HardwareTimerProtocol {
 
  +{  
    #include <signal.h>
    #include <sys/time.h>
  }+

  HP.handler() tickHandler = null
  bool repeat = false

  TimerMilli() {

  }

  public host setHandlerOnHost(HP.handler h) {
    tickHandler = h
  }

  public setHandler(HP.handler h) {
    tickHandler = h
  }

  public start() {
    resetTimer()
    +{ signal(SIGALRM, `sigAlarm`) }+    

    repeat = true
  }

  public stop() {
    repeat = false
  }

  public bool isRunning() {
    return repeat == true
  }


  /////////////////////////////////////////////////////////
  // Private members
  /////////////////////////////////////////////////////////

  resetTimer() {
    if (repeat) {
      +{ signal(SIGALRM, `sigAlarm`) }+
    }

    +{
       struct itimerval tout_val;
       tout_val.it_interval.tv_sec = 0;
       tout_val.it_interval.tv_usec = 0;
       tout_val.it_value.tv_sec = 0; 
       tout_val.it_value.tv_usec = 1000;  /* 1 ms second timer */       
       setitimer(ITIMER_REAL, &tout_val,0);
    }+    
  }

  sigAlarm() {
    if (repeat) { resetTimer() }
    if (tickHandler != null) {  tickHandler() }
  }
 
}