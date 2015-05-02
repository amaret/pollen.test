
/*
 * ======== string literals ========
 */

static const char test69_Test_12__s__fileName[] = "Test_12.p";
static const char test69_Test_12__s__0[] = "TICK TICK TOCK!\n";
static const char test69_Test_12__s__2[] = "Test_12";
static const char test69_Test_12__s__1[] = "SHUTDOWN\n";

/*
 * ======== function definitions ========
 */

void test69_Test_12_pollen__run__E() {
    pollen_event_Events_test__E(&(test69_Test_12_e__V));
}

void test69_Test_12_tick__I() {
    virtual_mcu_ConsolePrint_printStr__E(test69_Test_12__s__0);
}

void test69_Test_12_pollen__shutdown__E( uint8 id ) {
    virtual_mcu_ConsolePrint_printStr__E(test69_Test_12__s__1);
}

void test69_Test_12_targetInit__I() {
}

