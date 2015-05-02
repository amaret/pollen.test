
/*
 * ======== string literals ========
 */

static const char local_mcu_TimerMilli__s__fileName[] = "TimerMilli.p";
static const char local_mcu_TimerMilli__s__0[] = "TimerMilli";

/*
 * ======== code injections ========
 */

  
    #include <signal.h>
    #include <sys/time.h>
  

/*
 * ======== function definitions ========
 */

void local_mcu_TimerMilli_setHandler__E( local_mcu_TimerMilli_HP_handler h ) {
    (local_mcu_TimerMilli_tickHandler__V) = (h);
}

void local_mcu_TimerMilli_stop__E() {
    (local_mcu_TimerMilli_repeat__V) = false;
}

bool local_mcu_TimerMilli_isRunning__E() {
    return(  (local_mcu_TimerMilli_repeat__V) == true  );
}

void local_mcu_TimerMilli_resetTimer__I() {
    if ((local_mcu_TimerMilli_repeat__V)) {
         signal(SIGALRM, local_mcu_TimerMilli_sigAlarm__I) ;

    }
    
       struct itimerval tout_val;
       tout_val.it_interval.tv_sec = 0;
       tout_val.it_interval.tv_usec = 0;
       tout_val.it_value.tv_sec = 0; 
       tout_val.it_value.tv_usec = 1000;  /* 1 ms second timer */       
       setitimer(ITIMER_REAL, &tout_val,0);
    ;

}

void local_mcu_TimerMilli_start__E() {
    local_mcu_TimerMilli_resetTimer__I();
     signal(SIGALRM, local_mcu_TimerMilli_sigAlarm__I) ;

    (local_mcu_TimerMilli_repeat__V) = true;
}

void local_mcu_TimerMilli_targetInit__I() {
}

void local_mcu_TimerMilli_sigAlarm__I() {
    if ((local_mcu_TimerMilli_repeat__V)) {
        local_mcu_TimerMilli_resetTimer__I();
    }
    if ((local_mcu_TimerMilli_tickHandler__V) != null) {
        local_mcu_TimerMilli_tickHandler__V();
    }
}

