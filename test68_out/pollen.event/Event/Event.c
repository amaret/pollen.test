
/*
 * ======== string literals ========
 */

static const char pollen_event_Event__s__fileName[] = "Event.p";
static const char pollen_event_Event__s__0[] = "Event";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 

/*
 * ======== function definitions ========
 */

void pollen_event_Event_Event_setHandler__E( pollen_event_Event_ this, pollen_event_Event_EP_handler h ) {
    (this->eventHandler) = (h);
}

void pollen_event_Event_Event_fire__E( pollen_event_Event_ this ) {
    if ((this->eventHandler) != null) {
        this->eventHandler();
    }
    printf("event fire!\n");

}

pollen_event_Event_ pollen_event_Event_Event_new___E( pollen_event_Event_ this, pollen_event_Event_EP_handler h ) {
    this->eventHandler = (h);
    return this;
}

