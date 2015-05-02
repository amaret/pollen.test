
/*
 * ======== string literals ========
 */

static const char virtual_mcu_TimerMilli__s__fileName[] = "TimerMilli.p";
static const char virtual_mcu_TimerMilli__s__0[] = "Virtual Hardware Timer Milli setHandlerOnHost()\n";
static const char virtual_mcu_TimerMilli__s__1[] = "TimerMilli";

/*
 * ======== code injections ========
 */

  
    #include <signal.h>
    #include <sys/time.h>
  

/*
 * ======== function definitions ========
 */

void virtual_mcu_TimerMilli_setHandler__E( virtual_mcu_TimerMilli_HP_handler h ) {
    (virtual_mcu_TimerMilli_tickHandler__V) = (h);
}

void virtual_mcu_TimerMilli_stop__E() {
    (virtual_mcu_TimerMilli_repeat__V) = false;
}

bool virtual_mcu_TimerMilli_isRunning__E() {
    return(  (virtual_mcu_TimerMilli_repeat__V) == true  );
}

void virtual_mcu_TimerMilli_resetTimer__I() {
    if ((virtual_mcu_TimerMilli_repeat__V)) {
         signal(SIGALRM, virtual_mcu_TimerMilli_sigAlarm__I) ;

    }
    
       struct itimerval tout_val;
       tout_val.it_interval.tv_sec = 0;
       tout_val.it_interval.tv_usec = 0;
       tout_val.it_value.tv_sec = 0; 
       tout_val.it_value.tv_usec = 1000;  /* 1 ms second timer */       
       setitimer(ITIMER_REAL, &tout_val,0);
    ;

}

void virtual_mcu_TimerMilli_start__E() {
    virtual_mcu_TimerMilli_resetTimer__I();
     signal(SIGALRM, virtual_mcu_TimerMilli_sigAlarm__I) ;

    (virtual_mcu_TimerMilli_repeat__V) = true;
}

void virtual_mcu_TimerMilli_targetInit__I() {
}

void virtual_mcu_TimerMilli_sigAlarm__I() {
    if ((virtual_mcu_TimerMilli_repeat__V)) {
        virtual_mcu_TimerMilli_resetTimer__I();
    }
    if ((virtual_mcu_TimerMilli_tickHandler__V) != null) {
        virtual_mcu_TimerMilli_tickHandler__V();
    }
}

