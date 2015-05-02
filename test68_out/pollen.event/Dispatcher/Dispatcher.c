
/*
 * ======== string literals ========
 */

static const char pollen_event_Dispatcher__s__fileName[] = "Dispatcher.p";
static const char pollen_event_Dispatcher__s__2[] = "Dispatcher";
static const char pollen_event_Dispatcher__s__0[] = "Event registered. Capacity=";
static const char pollen_event_Dispatcher__s__1[] = "In dispatch()..\n";

/*
 * ======== function definitions ========
 */

void pollen_event_Dispatcher_postFromInterrupt__E( struct pollen_event_Event*  e ) {
    pollen_event_EventQueue_EventQueue_add__E(&(pollen_event_Dispatcher_events__V), (e));
}

void pollen_event_Dispatcher_dispatch__I() {
    pollen_event_Event_ e;
    e = null;
    (e) = pollen_event_EventQueue_EventQueue_remove__E(&(pollen_event_Dispatcher_events__V));
    test68_Test_11_pollen__printStr((string)pollen_event_Dispatcher__s__1);
    while ((e) != null) {
        printf("Dispatching..");

        virtual_mcu_GlobalInterrupts_enable__E();
        pollen_event_Event_Event_fire__E(e);
        (e) = pollen_event_EventQueue_EventQueue_remove__E(&(pollen_event_Dispatcher_events__V));
    }
}

void pollen_event_Dispatcher_post__E( struct pollen_event_Event*  e ) {
    printf("Event posted..");

    virtual_mcu_GlobalInterrupts_disable__E();
    pollen_event_EventQueue_EventQueue_add__E(&(pollen_event_Dispatcher_events__V), (e));
    virtual_mcu_GlobalInterrupts_enable__E();
}

void pollen_event_Dispatcher_run__E() {
    uint8 count;
    uint8 limit;
    count = 0;
    limit = 25;
    virtual_mcu_GlobalInterrupts_enable__E();
    while (true) {
        virtual_mcu_GlobalInterrupts_disable__E();
        pollen_event_Dispatcher_dispatch__I();
        virtual_mcu_GlobalInterrupts_enable__E();
        (count)++;
        if ((count) > (limit)) {
            break;
        }
    }
}

void pollen_event_Dispatcher_targetInit__I() {
}

