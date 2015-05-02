
/*
 * ======== string literals ========
 */

static const char pollen_time_TimerManager__s__fileName[] = "TimerManager.p";
static const char pollen_time_TimerManager__s__0[] = "\nTIMER INIT";
static const char pollen_time_TimerManager__s__1[] = "Timer";
static const char pollen_time_TimerManager__s__2[] = "TimerManager";

/*
 * ======== function definitions ========
 */

bool pollen_time_TimerManager_Timer_repeats__E( pollen_time_TimerManager_Timer_ this ) {
    return(  (this->repeat)  );
}

void pollen_time_TimerManager_Timer_start__E( pollen_time_TimerManager_Timer_ this, struct pollen_events_Event*  e, uint16 d, bool r ) {
    bool state;
    state = pollen_interfaces_GlobalInterrupts_disable__E();
    if (!pollen_time_TimerManager_Timer_running__E(this)) {
        (this->expired) = (e);
        (this->duration) = (d);
        (this->elapsed) = 0;
        (this->repeat) = (r);
        (pollen_time_TimerManager_timers__A[(this->id)]) = this;
    }
    pollen_interfaces_GlobalInterrupts_restore__E((state));
    if (!pollen_interfaces_TimerDriver_running__E()) {
        pollen_interfaces_TimerDriver_start__E();
    }
}

pollen_time_TimerManager_Timer_ pollen_time_TimerManager_Timer_new___E( pollen_time_TimerManager_Timer_ this ) {
    return this;
}

bool pollen_time_TimerManager_Timer_running__E( pollen_time_TimerManager_Timer_ this ) {
    return(  (pollen_time_TimerManager_timers__A[(this->id)]) != null  );
}

void pollen_time_TimerManager_Timer_setElapsed__E( pollen_time_TimerManager_Timer_ this, uint32 i ) {
    (this->elapsed) = (i);
}

void pollen_time_TimerManager_Timer_stop__E( pollen_time_TimerManager_Timer_ this ) {
    bool state;
    state = pollen_interfaces_GlobalInterrupts_disable__E();
    (pollen_time_TimerManager_timers__A[(this->id)]) = null;
    pollen_interfaces_GlobalInterrupts_restore__E((state));
}

void pollen_time_TimerManager_timerISR__I() {
    bool off;
    uint8 i;
    off = true;
    for (i = 0; (i) < (pollen_time_TimerManager_numTimers__V); (i)++) {
        if ((pollen_time_TimerManager_timers__A[(i)]) != null) {
            (pollen_time_TimerManager_timers__A[(i)]->elapsed)++;
            if ((pollen_time_TimerManager_timers__A[(i)]->elapsed) == (pollen_time_TimerManager_timers__A[(i)]->duration)) {
                if ((pollen_time_TimerManager_timers__A[(i)]->expired) != null) {
                    pollen_events_Dispatcher_postFromInterrupt__E((pollen_time_TimerManager_timers__A[(i)]->expired));
                    if ((pollen_time_TimerManager_timers__A[(i)]->repeat)) {
                        (pollen_time_TimerManager_timers__A[(i)]->elapsed) = 0;
                    }
                    else {
                        pollen_time_TimerManager_Timer_stop__E((pollen_time_TimerManager_timers__A[(i)]));
                    }
                }
                else {
                    pollen_time_TimerManager_Timer_stop__E((pollen_time_TimerManager_timers__A[(i)]));
                }
            }
            (off) = false;
        }
    }
    if ((off)) {
        pollen_interfaces_TimerDriver_stop__E();
    }
}

void pollen_time_TimerManager_targetInit__I() {
}

uint16 pollen_time_TimerManager_Timer_ticksPerSecond__E( pollen_time_TimerManager_Timer_ this ) {
    return(  1000  );
}

uint32 pollen_time_TimerManager_Timer_getElapsed__E( pollen_time_TimerManager_Timer_ this ) {
    return(  (this->elapsed)  );
}

