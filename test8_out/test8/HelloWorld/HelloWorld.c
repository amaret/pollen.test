
/*
 * ======== string literals ========
 */

static const char test8_HelloWorld__s__fileName[] = "HelloWorld.p";
static const char test8_HelloWorld__s__0[] = "HelloWorld";

/*
 * ======== function definitions ========
 */

void test8_HelloWorld_pollen__run__E() {
    test8_HelloWorld_start__I((test8_HelloWorld_e1__V));
    test8_HelloWorld_start__I((test8_HelloWorld_e2__V));
}

bool test8_HelloWorld_start__I( struct test8_Event*  e ) {
    uint8 code;
    code = test8_Event_Event_getCode__E(e);
    return(  true  );
}

void test8_HelloWorld_handle__E( uint8 z ) {
    uint8 x;
    x = 3;
}

void test8_HelloWorld_targetInit__I() {
}

