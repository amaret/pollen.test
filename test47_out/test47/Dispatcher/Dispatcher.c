
/*
 * ======== string literals ========
 */

static const char test47_Dispatcher__s__fileName[] = "Dispatcher.p";
static const char test47_Dispatcher__s__0[] = "Dispatcher";

/*
 * ======== function definitions ========
 */

void test47_Dispatcher_post__E( struct test47_Ev*  e ) {
    test47_EvQueue_EvQueue_add__E(&(test47_Dispatcher_myEventQueue__V), (e));
}

void test47_Dispatcher_run__E() {
    test47_Ev_ e;
    while (true) {
        e = test47_EvQueue_EvQueue_remove__E(&(test47_Dispatcher_myEventQueue__V));
        if ((e) != null) {
            test47_Ev_Ev_handle__E(e, test47_Ev_Ev_getData__E(e));
            break;
        }
    }
}

void test47_Dispatcher_targetInit__I() {
}

