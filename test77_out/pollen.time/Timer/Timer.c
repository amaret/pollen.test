
/*
 * ======== string literals ========
 */

static const char pollen_time_Timer__s__fileName[] = "Timer.p";
static const char pollen_time_Timer__s__0[] = "Timer";

/*
 * ======== function definitions ========
 */

void pollen_time_Timer_Timer_stop__E( pollen_time_Timer_ this ) {
    this->active = false;
}

void pollen_time_Timer_Timer_start__E( pollen_time_Timer_ this, uint16 ms, bool repeat ) {
    this->duration = (ms);
    this->periodic = (repeat);
    this->tickCount = 0;
    pollen_time_TimerManager_addTimer__E(this);
    this->active = true;
}

void pollen_time_Timer_Timer_fire__E( pollen_time_Timer_ this ) {
    pollen_event_Event_Event_fire__E(&(this->tickEvent));
}

void pollen_time_Timer_Timer_tick__E( pollen_time_Timer_ this ) {
    if (this->active) {
        this->tickCount++;
        if (this->tickCount == this->duration) {
            pollen_event_Event_Event_post__E(&(this->tickEvent));
            if (this->periodic) {
                this->tickCount = 0;
            }
            else {
                pollen_time_Timer_Timer_stop__E(this);
            }
        }
    }
}

bool pollen_time_Timer_Timer_isActive__E( pollen_time_Timer_ this ) {
    return(  this->active  );
}

pollen_time_Timer_ pollen_time_Timer_Timer_new___E( pollen_time_Timer_ this ) {
    return this;
}

