
/*
 * ======== string literals ========
 */

static const char test16_Test__s__fileName[] = "Test.p";
static const char test16_Test__s__0[] = "Test";

/*
 * ======== function definitions ========
 */

void test16_Test_pollen__run__E() {
    test16_Mod_bar__I();
    foo /* ?? missing symbol ?? */ ();
    test16_Mod_foo__I();
    test16_Mod_foo__I();
    test16_Mod_bar__I();
}

void test16_Test_pollen__shutdown__E( uint8 id ) {
}

void test16_Test_targetInit__I() {
}

