
/*
 * ======== string literals ========
 */

static const char test72_Test_13__s__fileName[] = "Test_13.p";
static const char test72_Test_13__s__0[] = "shutdown\n";
static const char test72_Test_13__s__1[] = "tick\n";
static const char test72_Test_13__s__2[] = "Test_13";

/*
 * ======== function definitions ========
 */

void test72_Test_13_pollen__run__E() {
    pollen_event_Dispatcher_post__E(&(test72_Test_13_e__V));
    pollen_event_Dispatcher_run__E();
}

void test72_Test_13_pollen__shutdown__E( uint8 id ) {
    virtual_mcu_ConsolePrint_printStr__E(test72_Test_13__s__0);
}

void test72_Test_13_tick__I() {
    virtual_mcu_ConsolePrint_printStr__E(test72_Test_13__s__1);
}

void test72_Test_13_targetInit__I() {
}

