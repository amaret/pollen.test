
/*
 * ======== string literals ========
 */

static const char pollen_event_Newsroom__s__fileName[] = "Newsroom.p";
static const char pollen_event_Newsroom__s__0[] = "Newsroom: event registered. Event capacity = ";
static const char pollen_event_Newsroom__s__2[] = "Newsroom";
static const char pollen_event_Newsroom__s__1[] = "\n";

/*
 * ======== function definitions ========
 */

void pollen_event_Newsroom_postFromInterrupt__E( struct pollen_event_Event*  event ) {
    pollen_event_EventQueue_EventQueue_add__E(&(pollen_event_Newsroom_events__V), (event));
}

void pollen_event_Newsroom_dispatch__I() {
    pollen_event_Event_ e;
    e = null;
    (e) = pollen_event_EventQueue_EventQueue_remove__E(&(pollen_event_Newsroom_events__V));
    while ((e) != null) {
        local_mcu_GlobalInterrupts_enable__E();
        pollen_event_Event_Event_fire__E(e);
        (e) = pollen_event_EventQueue_EventQueue_remove__E(&(pollen_event_Newsroom_events__V));
    }
}

void pollen_event_Newsroom_post__E( struct pollen_event_Event*  event ) {
    local_mcu_GlobalInterrupts_disable__E();
    pollen_event_EventQueue_EventQueue_add__E(&(pollen_event_Newsroom_events__V), (event));
    local_mcu_GlobalInterrupts_enable__E();
}

void pollen_event_Newsroom_run__E() {
    volatile bool loop;
    loop = true;
    local_mcu_GlobalInterrupts_enable__E();
    while ((loop)) {
        local_mcu_GlobalInterrupts_disable__E();
        pollen_event_Newsroom_dispatch__I();
        local_mcu_GlobalInterrupts_enable__E();
    }
}

void pollen_event_Newsroom_targetInit__I() {
}

