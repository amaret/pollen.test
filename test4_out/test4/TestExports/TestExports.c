
/*
 * ======== string literals ========
 */

static const char test4_TestExports__s__fileName[] = "TestExports.p";
static const char test4_TestExports__s__0[] = "TestExports";

/*
 * ======== function definitions ========
 */

void test4_TestExports_pollen__run__E() {
}

void test4_TestExports_enable__I() {
}

void test4_TestExports_foo__I() {
    test4_GlobalInterrupts_enable__E();
    test4_GlobalInterrupts_enable__E();
    test4_GlobalInterrupts_disable__E();
    test4_OtherInterrupts_other_enable__E();
    test4_OtherInterrupts_other_disable__E();
    test4_TestExports_enable__I();
    test4_OtherInterrupts_disable__E();
    test4_TestExports_enable__I();
    test4_Core_wait__E(3);
}

void test4_TestExports_targetInit__I() {
}

