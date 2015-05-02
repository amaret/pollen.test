
/*
 * ======== string literals ========
 */

static const char pollen_events_AE__s__fileName[] = "AE.p";
static const char pollen_events_AE__s__0[] = "AE";

/*
 * ======== function definitions ========
 */

void pollen_events_AE_AE_setHandler__E( pollen_events_AE_ this, pollen_events_AE_EH_handle handler ) {
    this->handler = (handler);
}

void pollen_events_AE_AE_setData__E( pollen_events_AE_ this, uint8 data ) {
    this->data = (data);
}

uint8 pollen_events_AE_AE_getPriority__E( pollen_events_AE_ this ) {
    return(  (this->priority)  );
}

void pollen_events_AE_AE_handle__E( pollen_events_AE_ this ) {
    if ((this->handler) != null) {
        this->handler(/* unknown invoker ?? */, this);
    }
}

pollen_events_AE_ pollen_events_AE_AE_new___E( pollen_events_AE_ this, pollen_events_AE_EH_handle handler, uint8 data, uint8 priority ) {
    this->handler = (handler);
    this->data = (data);
    this->priority = (priority);
    return this;
}

pollen_events_AE_EH_handle pollen_events_AE_AE_getHandler__E( pollen_events_AE_ this ) {
    return(  this->handler  );
}

void pollen_events_AE_AE_setPriority__E( pollen_events_AE_ this, uint8 priority ) {
    this->priority = (priority);
}

uint8 pollen_events_AE_AE_getData__E( pollen_events_AE_ this ) {
    return(  (this->data)  );
}

