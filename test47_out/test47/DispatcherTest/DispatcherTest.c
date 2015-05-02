
/*
 * ======== string literals ========
 */

static const char test47_DispatcherTest__s__fileName[] = "DispatcherTest.p";
static const char test47_DispatcherTest__s__0[] = "DispatcherTest";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 
 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test47_DispatcherTest_pollen__run__E() {
    test47_Dispatcher_post__E(&(test47_DispatcherTest_e1__V));
    test47_Dispatcher_post__E(&(test47_DispatcherTest_e2__V));
    test47_Dispatcher_post__E(&(test47_DispatcherTest_e3__V));
    test47_Dispatcher_post__E(&(test47_DispatcherTest_e2__V));
    test47_Dispatcher_post__E(&(test47_DispatcherTest_e1__V));
    test47_Dispatcher_post__E(&(test47_DispatcherTest_e3__V));
    test47_Dispatcher_post__E(&(test47_DispatcherTest_e3__V));
    test47_Dispatcher_post__E(&(test47_DispatcherTest_e2__V));
    test47_Dispatcher_post__E(&(test47_DispatcherTest_e1__V));
    test47_Dispatcher_run__E();
    test47_Dispatcher_run__E();
    test47_Dispatcher_run__E();
    test47_Dispatcher_run__E();
    test47_Dispatcher_run__E();
    test47_Dispatcher_run__E();
    test47_Dispatcher_run__E();
    test47_Dispatcher_run__E();
    test47_Dispatcher_run__E();
     exit(0); ;

}

void test47_DispatcherTest_handle__E( uint8 data ) {
    if ((data) == 11) {
        printf("%s\n", "ev1 handler") ;

    }
    else if ((data) == 22) {
        printf("%s\n", "ev2 handler") ;

    }
    else if ((data) == 33) {
        printf("%s\n", "ev3 handler") ;

    }
    else {
        printf("%s\n", "no valid handler") ;

    }
}

void test47_DispatcherTest_targetInit__I() {
    test47_Ev_Ev_setPriority__E(&(test47_DispatcherTest_e1__V), 1);
    test47_Ev_Ev_setHandler__E(&(test47_DispatcherTest_e1__V), (test47_DispatcherTest_handle__E));
    test47_Ev_Ev_setData__E(&(test47_DispatcherTest_e1__V), 11);
    test47_Ev_Ev_setPriority__E(&(test47_DispatcherTest_e2__V), 2);
    test47_Ev_Ev_setHandler__E(&(test47_DispatcherTest_e2__V), (test47_DispatcherTest_handle__E));
    test47_Ev_Ev_setData__E(&(test47_DispatcherTest_e2__V), 22);
    test47_Ev_Ev_setPriority__E(&(test47_DispatcherTest_e3__V), 3);
    test47_Ev_Ev_setHandler__E(&(test47_DispatcherTest_e3__V), (test47_DispatcherTest_handle__E));
    test47_Ev_Ev_setData__E(&(test47_DispatcherTest_e3__V), 33);
}

