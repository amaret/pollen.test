
from pollen.event import HandlerProtocol as HP
from pollen.hardware import TimerMilliProtocol


module TimerMilli implements TimerMilliProtocol {
 
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
    print "Virtual Hardware Timer Milli setHandlerOnHost()\n"
  }

  public setHandler(HP.handler h) {
    tickHandler = h
  }

  public start() {
    +{ printf("Virtual Hardware Timer Milli start()\n") }+

    resetTimer()
    +{ signal(SIGALRM, `sigAlarm`) }+    

    repeat = true
  }

  public stop() {
    +{ printf("Virtual Hardware Timer Milli stop()\n") }+
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