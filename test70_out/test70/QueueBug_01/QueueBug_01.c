
/*
 * ======== string literals ========
 */

static const char test70_QueueBug_01__s__fileName[] = "QueueBug_01.p";
static const char test70_QueueBug_01__s__3[] = "TICK3\n";
static const char test70_QueueBug_01__s__1[] = "TICK1\n";
static const char test70_QueueBug_01__s__2[] = "TICK2\n";
static const char test70_QueueBug_01__s__4[] = "TICK4\n";
static const char test70_QueueBug_01__s__5[] = "TICK5\n";
static const char test70_QueueBug_01__s__6[] = "QueueBug_01";
static const char test70_QueueBug_01__s__0[] = "H IS NULL!\n";

/*
 * ======== function definitions ========
 */

void test70_QueueBug_01_tick4__I() {
    virtual_mcu_ConsolePrint_printStr__E(test70_QueueBug_01__s__4);
}

void test70_QueueBug_01_pollen__run__E() {
    pollen_data_HandlerQueue_HandlerQueue_add__E(&(test70_QueueBug_01_eventHandlers__V), (test70_QueueBug_01_tick5__I));
    pollen_data_HandlerQueue_HandlerQueue_add__E(&(test70_QueueBug_01_eventHandlers__V), (test70_QueueBug_01_tick4__I));
    pollen_data_HandlerQueue_HandlerQueue_add__E(&(test70_QueueBug_01_eventHandlers__V), (test70_QueueBug_01_tick3__I));
    pollen_data_HandlerQueue_HandlerQueue_add__E(&(test70_QueueBug_01_eventHandlers__V), (test70_QueueBug_01_tick2__I));
    pollen_data_HandlerQueue_HandlerQueue_add__E(&(test70_QueueBug_01_eventHandlers__V), (test70_QueueBug_01_tick1__I));
    while (!pollen_data_HandlerQueue_HandlerQueue_isEmpty__E(&(test70_QueueBug_01_eventHandlers__V))) {
        (test70_QueueBug_01_h__V) = pollen_data_HandlerQueue_HandlerQueue_remove__E(&(test70_QueueBug_01_eventHandlers__V));
        if ((test70_QueueBug_01_h__V) != null) {
            test70_QueueBug_01_h__V();
        }
        else {
            virtual_mcu_ConsolePrint_printStr__E(test70_QueueBug_01__s__0);
        }
    }
}

void test70_QueueBug_01_tick3__I() {
    virtual_mcu_ConsolePrint_printStr__E(test70_QueueBug_01__s__3);
}

void test70_QueueBug_01_tick2__I() {
    virtual_mcu_ConsolePrint_printStr__E(test70_QueueBug_01__s__2);
}

void test70_QueueBug_01_tick1__I() {
    virtual_mcu_ConsolePrint_printStr__E(test70_QueueBug_01__s__1);
}

void test70_QueueBug_01_tick5__I() {
    virtual_mcu_ConsolePrint_printStr__E(test70_QueueBug_01__s__5);
}

void test70_QueueBug_01_pollen__shutdown__E( uint8 id ) {
}

void test70_QueueBug_01_targetInit__I() {
}

