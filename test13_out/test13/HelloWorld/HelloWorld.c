
/*
 * ======== string literals ========
 */

static const char test13_HelloWorld__s__fileName[] = "HelloWorld.p";
static const char test13_HelloWorld__s__0[] = "HelloWorld";

/*
 * ======== function definitions ========
 */

void test13_HelloWorld_pollen__run__E() {
    test13_HelloWorld_start__I((test13_HelloWorld_e1__V));
    test13_HelloWorld_start__I((test13_HelloWorld_e2__V));
}

bool test13_HelloWorld_start__I( struct test13_Event*  e ) {
    return(  true  );
}

void test13_HelloWorld_handle__E( struct test13_Event*  y ) {
    uint8 x;
    uint8 z;
    x = (test13_HelloWorld_ClockSource_SCLK);
    z = (test13_YEnum_YEnum_Y1);
}

void test13_HelloWorld_targetInit__I() {
}

