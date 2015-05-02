
/*
 * ======== string literals ========
 */

static const char test68_Test_11__s__fileName[] = "Test_11.p";
static const char test68_Test_11__s__2[] = "TICK 1\n";
static const char test68_Test_11__s__1[] = "Shutdown\n";
static const char test68_Test_11__s__6[] = "TICK 5\n";
static const char test68_Test_11__s__5[] = "TICK 4\n";
static const char test68_Test_11__s__0[] = "in loop to post events\n";
static const char test68_Test_11__s__3[] = "TICK 2\n";
static const char test68_Test_11__s__4[] = "TICK 3\n";
static const char test68_Test_11__s__7[] = "Test_11";

/*
 * ======== code injections ========
 */

 #include <stdio.h> 

/*
 * ======== function definitions ========
 */

void test68_Test_11_tick4__I() {
    test68_Test_11_pollen__printStr((string)test68_Test_11__s__5);
}

void test68_Test_11_pollen__run__E() {
    pollen_event_Event_ e;
    uint8 i;
    e = null;
    for (i = 0; (i) < (test68_Test_11_NumEvents__V); ++(i)) {
        test68_Test_11_pollen__printStr((string)test68_Test_11__s__0);
        (e) = &(test68_Test_11_events__A[(i)]);
        pollen_event_Dispatcher_post__E((e));
    }
    pollen_event_Dispatcher_run__E();
}

void test68_Test_11_tick3__I() {
    test68_Test_11_pollen__printStr((string)test68_Test_11__s__4);
}

void test68_Test_11_tick2__I() {
    test68_Test_11_pollen__printStr((string)test68_Test_11__s__3);
}

void test68_Test_11_tick1__I() {
    test68_Test_11_pollen__printStr((string)test68_Test_11__s__2);
}

void test68_Test_11_pollen__shutdown__E( uint8 id ) {
    virtual_mcu_ConsolePrint_printStr__E(test68_Test_11__s__1);
}

void test68_Test_11_tick5__I() {
    test68_Test_11_pollen__printStr((string)test68_Test_11__s__6);
}

void test68_Test_11_targetInit__I() {
}

