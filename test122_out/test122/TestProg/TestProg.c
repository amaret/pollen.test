
/*
 * ======== string literals ========
 */

static const char test122_TestProg__s__fileName[] = "TestProg.p";
static const char test122_TestProg__s__0[] = "TestProg";

/*
 * ======== function definitions ========
 */

void test122_TestProg_bar__I() {
        test122_SleepWakeImpl_wake__E();
}

void test122_TestProg_pollen__run__E() {
    test122_Module1_foo__E();
        test122_SleepWakeImpl_sleep__E(7);
        test122_DynMemImpl_malloc__E(3);
        test122_DynMemImpl_free__E(3);
    test122_TestProg_bar__I();
}

void test122_TestProg_targetInit__I() {
}

