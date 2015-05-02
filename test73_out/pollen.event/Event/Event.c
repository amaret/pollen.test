
/*
 * ======== string literals ========
 */

static const char pollen_event_Event__s__fileName[] = "Event.p";
static const char pollen_event_Event__s__0[] = "Event";

/*
 * ======== function definitions ========
 */

void pollen_event_Event_Event_setHandler__E( pollen_event_Event_ this, pollen_event_Event_HP_handler h ) {
    this->eventHandler = (h);
}

void pollen_event_Event_Event_postFromInterrupt__E( pollen_event_Event_ this ) {
    pollen_event_Newsroom_postFromInterrupt__E(this);
}

void pollen_event_Event_Event_post__E( pollen_event_Event_ this ) {
    pollen_event_Newsroom_post__E(this);
}

void pollen_event_Event_Event_fire__E( pollen_event_Event_ this ) {
    if (this->eventHandler != null) {
        this->eventHandler();
    }
}

pollen_event_Event_ pollen_event_Event_Event_new___E( pollen_event_Event_ this, pollen_event_Event_HP_handler h ) {
    this->eventHandler = (h);
    return this;
}

pollen_event_Event_HP_handler pollen_event_Event_Event_getHandler__E( pollen_event_Event_ this ) {
    return(  this->eventHandler  );
}

