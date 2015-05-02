
/*
 * ======== string literals ========
 */

static const char pollen_time_TimerManager__s__fileName[] = "TimerManager.p";
static const char pollen_time_TimerManager__s__1[] = "(total=";
static const char pollen_time_TimerManager__s__0[] = "TimerManager: registering milli timer ";
static const char pollen_time_TimerManager__s__2[] = ")\n";
static const char pollen_time_TimerManager__s__3[] = "TimerManager";

/*
 * ======== function definitions ========
 */

bool pollen_time_TimerManager_addTimer__E( struct pollen_time_Timer*  t ) {
    bool added;
    uint8 i;
    added = true;
    
    for ((i) = 0; (i) < (pollen_time_TimerManager_numMsTimers__V); ++(i)) {
        if ((pollen_time_TimerManager_msTimers__A[(i)]) == null) {
            (pollen_time_TimerManager_msTimers__A[(i)]) = (t);
            break;
        }
    }
    if ((i) == (pollen_time_TimerManager_numMsTimers__V)) {
        (added) = false;
    }
    else if (pollen_time_TimerManager_isActive__E() == false) {
        pollen_time_TimerManager_start__E();
    }
    return(  (added)  );
}

void pollen_time_TimerManager_stop__E() {
    if (local_mcu_TimerMilli_isRunning__E()) {
        local_mcu_TimerMilli_stop__E();
    }
}

void pollen_time_TimerManager_start__E() {
    if (!local_mcu_TimerMilli_isRunning__E()) {
        local_mcu_TimerMilli_start__E();
    }
}

bool pollen_time_TimerManager_isActive__E() {
    return(  local_mcu_TimerMilli_isRunning__E()  );
}

void pollen_time_TimerManager_targetInit__I() {
}

void pollen_time_TimerManager_tickISR__I() {
    bool oneActive;
    uint8 i;
    pollen_time_Timer_ t;
    oneActive = false;
    for (i = 0; (i) < (pollen_time_TimerManager_numMsTimers__V); ++(i)) {
        if ((pollen_time_TimerManager_msTimers__A[(i)]) != null) {
            t = null;
            (t) = (pollen_time_TimerManager_msTimers__A[(i)]);
            if (pollen_time_Timer_Timer_isActive__E(t)) {
                pollen_time_Timer_Timer_tick__E(t);
                (oneActive) = true;
            }
        }
    }
    if (!(oneActive)) {
        pollen_time_TimerManager_stop__E();
    }
}

