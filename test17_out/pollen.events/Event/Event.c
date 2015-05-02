
/*
 * ======== string literals ========
 */

static const char pollen_events_Event__s__fileName[] = "Event.p";
static const char pollen_events_Event__s__0[] = "Event";

/*
 * ======== function definitions ========
 */

void pollen_events_Event_Event_setHandler__E( pollen_events_Event_ this, pollen_events_Event_EH_handle handler ) {
    this->handler = (handler);
}

void pollen_events_Event_Event_setData__E( pollen_events_Event_ this, uint8 data ) {
    this->data = (data);
}

uint8 pollen_events_Event_Event_getPriority__E( pollen_events_Event_ this ) {
    return(  (this->priority)  );
}

void pollen_events_Event_Event_handle__E( pollen_events_Event_ this ) {
    if ((this->handler) != null) {
        this->handler(/* unknown invoker ?? */, this);
    }
}

pollen_events_Event_ pollen_events_Event_Event_new___E( pollen_events_Event_ this, pollen_events_Event_EH_handle handler, uint8 data, uint8 priority ) {
    this->handler = (handler);
    this->data = (data);
    this->priority = (priority);
    return this;
}

pollen_events_Event_EH_handle pollen_events_Event_Event_getHandler__E( pollen_events_Event_ this ) {
    return(  this->handler  );
}

void pollen_events_Event_Event_setPriority__E( pollen_events_Event_ this, uint8 priority ) {
    this->priority = (priority);
}

uint8 pollen_events_Event_Event_getData__E( pollen_events_Event_ this ) {
    return(  (this->data)  );
}

