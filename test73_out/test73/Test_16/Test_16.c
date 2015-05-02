
/*
 * ======== string literals ========
 */

static const char test73_Test_16__s__fileName[] = "Test_16.p";
static const char test73_Test_16__s__2[] = "Shutdown\n";
static const char test73_Test_16__s__3[] = "Test_16";
static const char test73_Test_16__s__0[] = "Tick1\n";
static const char test73_Test_16__s__1[] = "Tick2\n";

/*
 * ======== function definitions ========
 */

void test73_Test_16_pollen__run__E() {
    pollen_event_Event_Event_post__E(&(test73_Test_16_e1__V));
    pollen_event_Event_Event_post__E(&(test73_Test_16_e2__V));
    pollen_event_Newsroom_run__E();
}

void test73_Test_16_tick2__I() {
    virtual_mcu_ConsolePrint_printStr__E(test73_Test_16__s__1);
}

void test73_Test_16_tick1__I() {
    virtual_mcu_ConsolePrint_printStr__E(test73_Test_16__s__0);
}

void test73_Test_16_pollen__shutdown__E( uint8 id ) {
    virtual_mcu_ConsolePrint_printStr__E(test73_Test_16__s__2);
}

void test73_Test_16_targetInit__I() {
}

