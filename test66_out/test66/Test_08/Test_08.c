
/*
 * ======== string literals ========
 */

static const char test66_Test_08__s__fileName[] = "Test_08.p";
static const char test66_Test_08__s__1[] = "TICK 1\n";
static const char test66_Test_08__s__6[] = "Test_08";
static const char test66_Test_08__s__5[] = "TICK 5\n";
static const char test66_Test_08__s__4[] = "TICK 4\n";
static const char test66_Test_08__s__0[] = "In remove while loop\n";
static const char test66_Test_08__s__2[] = "TICK 2\n";
static const char test66_Test_08__s__3[] = "TICK 3\n";

/*
 * ======== function definitions ========
 */

void test66_Test_08_tick4__I() {
    test66_Test_08_pollen__printStr((string)test66_Test_08__s__4);
}

void test66_Test_08_pollen__run__E() {
    pollen_data_HandlerQueue_HandlerQueue_add__E(&(test66_Test_08_handlers__V), (test66_Test_08_tick5__I));
    pollen_data_HandlerQueue_HandlerQueue_add__E(&(test66_Test_08_handlers__V), (test66_Test_08_tick4__I));
    pollen_data_HandlerQueue_HandlerQueue_add__E(&(test66_Test_08_handlers__V), (test66_Test_08_tick3__I));
    pollen_data_HandlerQueue_HandlerQueue_add__E(&(test66_Test_08_handlers__V), (test66_Test_08_tick2__I));
    pollen_data_HandlerQueue_HandlerQueue_add__E(&(test66_Test_08_handlers__V), (test66_Test_08_tick1__I));
    while (!pollen_data_HandlerQueue_HandlerQueue_isEmpty__E(&(test66_Test_08_handlers__V))) {
        (test66_Test_08_h__V) = pollen_data_HandlerQueue_HandlerQueue_remove__E(&(test66_Test_08_handlers__V));
        test66_Test_08_pollen__printStr((string)test66_Test_08__s__0);
        if ((test66_Test_08_h__V) != null) {
            test66_Test_08_h__V();
        }
    }
}

void test66_Test_08_tick3__I() {
    test66_Test_08_pollen__printStr((string)test66_Test_08__s__3);
}

void test66_Test_08_tick2__I() {
    test66_Test_08_pollen__printStr((string)test66_Test_08__s__2);
}

void test66_Test_08_tick1__I() {
    test66_Test_08_pollen__printStr((string)test66_Test_08__s__1);
}

void test66_Test_08_tick5__I() {
    test66_Test_08_pollen__printStr((string)test66_Test_08__s__5);
}

void test66_Test_08_pollen__shutdown__E( uint8 id ) {
}

void test66_Test_08_targetInit__I() {
}

