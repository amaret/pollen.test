
/*
 * ======== string literals ========
 */

static const char pollen_time_TimerMilli__s__fileName[] = "TimerMilli.p";
static const char pollen_time_TimerMilli__s__0[] = "TimerMilli";

/*
 * ======== function definitions ========
 */

bool pollen_time_TimerMilli_running__E() {
    return(  (pollen_time_TimerMilli_duration__V) != 0 && pollen_interfaces_TimerDriver_running__E()  );
}

void pollen_time_TimerMilli_stop__E() {
    pollen_interfaces_TimerDriver_stop__E();
    pollen_time_TimerMilli_duration__V = 0;
}

void pollen_time_TimerMilli_start__E( pollen_time_TimerMilli_Handler_handle h, uint16 duration, bool repeat ) {
    pollen_time_TimerMilli_clientTick__V = (h);
    pollen_time_TimerMilli_count__V = 0;
    pollen_time_TimerMilli_duration__V = (duration);
    pollen_time_TimerMilli_repeat__V = (repeat);
    pollen_interfaces_TimerDriver_start__E();
}

void pollen_time_TimerMilli_targetInit__I() {
    pollen_interfaces_TimerDriver_setHandler__E((pollen_time_TimerMilli_timerTick__E));
}

void pollen_time_TimerMilli_timerTick__E() {
    ++(pollen_time_TimerMilli_count__V);
    if ((pollen_time_TimerMilli_count__V) == (pollen_time_TimerMilli_duration__V)) {
        if ((pollen_time_TimerMilli_clientTick__V) != null) {
            pollen_time_TimerMilli_clientTick__V();
        }
        (pollen_time_TimerMilli_count__V) = 0;
        if (!(pollen_time_TimerMilli_repeat__V)) {
            pollen_time_TimerMilli_stop__E();
        }
    }
}

