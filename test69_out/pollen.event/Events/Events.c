
/*
 * ======== string literals ========
 */

static const char pollen_event_Events__s__fileName[] = "Events.p";
static const char pollen_event_Events__s__2[] = "in Events(), numEvents=";
static const char pollen_event_Events__s__5[] = "in registerEvent(), Event Registered: ";
static const char pollen_event_Events__s__8[] = "Events";
static const char pollen_event_Events__s__4[] = "in registerEvent(), numEvents=";
static const char pollen_event_Events__s__1[] = "Event";
static const char pollen_event_Events__s__6[] = " \n";
static const char pollen_event_Events__s__7[] = "numEvents=";
static const char pollen_event_Events__s__0[] = "in Event new_host\n";
static const char pollen_event_Events__s__3[] = "\n";

/*
 * ======== function definitions ========
 */

void pollen_event_Events_Event_setHandler__E( pollen_event_Events_Event_ this, pollen_event_Events_HP_handler h ) {
    (this->handler) = (h);
}

void pollen_event_Events_test__E( pollen_event_Events_Event_ e ) {
    virtual_mcu_ConsolePrint_printStr__E(pollen_event_Events__s__7);
    virtual_mcu_ConsolePrint_printUint__E((pollen_event_Events_numEvents__V));
    e->handler();
}

pollen_event_Events_Event_ pollen_event_Events_Event_new___E( pollen_event_Events_Event_ this, pollen_event_Events_HP_handler h ) {
    (this->handler) = (h);
    return this;
}

void pollen_event_Events_targetInit__I() {
}

