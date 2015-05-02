
/*
 * ======== string literals ========
 */

static const char pollen_events_Dispatcher__s__fileName[] = "Dispatcher.p";
static const char pollen_events_Dispatcher__s__0[] = "Dispatcher";

/*
 * ======== function definitions ========
 */

void pollen_events_Dispatcher_postFromInterrupt__E( struct pollen_events_AE*  e ) {
    pollen_data_AEQueue_AEQueue_enqueue__E(Dispatcher.AEQueue, (e));
}

void pollen_events_Dispatcher_post__E( struct pollen_events_AE*  e ) {
    bool on;
    on = pollen_interfaces_GlobalInterrupts_disable__E();
    pollen_data_AEQueue_AEQueue_enqueue__E(Dispatcher.AEQueue, (e));
    pollen_interfaces_GlobalInterrupts_restore__E((on));
}

void pollen_events_Dispatcher_run__E() {
    bool on;
    pollen_events_AE_ e;
    pollen_interfaces_GlobalInterrupts_enable__E();
    while (true) {
        on = pollen_interfaces_GlobalInterrupts_disable__E();
        e = pollen_data_AEQueue_AEQueue_dequeue__E(Dispatcher.AEQueue);
        pollen_interfaces_GlobalInterrupts_restore__E((on));
        if ((e) != null) {
            pollen_events_AE_AE_handle__E(e);
        }
    }
}

void pollen_events_Dispatcher_targetInit__I() {
}

