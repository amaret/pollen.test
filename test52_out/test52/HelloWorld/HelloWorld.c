
/*
 * ======== string literals ========
 */

static const char test52_HelloWorld__s__fileName[] = "HelloWorld.p";
static const char test52_HelloWorld__s__9[] = "Enter fcnrefsCalls:\n";
static const char test52_HelloWorld__s__11[] = "Enter fcnrefsParameters:\n";
static const char test52_HelloWorld__s__10[] = "Leave fcnrefsCalls\n";
static const char test52_HelloWorld__s__6[] = ">> in bar4()\n";
static const char test52_HelloWorld__s__0[] = "Inner";
static const char test52_HelloWorld__s__12[] = "Leave fcnrefsParameters\n";
static const char test52_HelloWorld__s__3[] = ">> in bar()\n";
static const char test52_HelloWorld__s__8[] = ">> in bar5_and_rtn()\n";
static const char test52_HelloWorld__s__1[] = ">> in foo()\n";
static const char test52_HelloWorld__s__5[] = ">> in bar3()\n";
static const char test52_HelloWorld__s__2[] = ">> in foo2()\n";
static const char test52_HelloWorld__s__4[] = ">> in bar2()\n";
static const char test52_HelloWorld__s__13[] = "HelloWorld";
static const char test52_HelloWorld__s__7[] = ">> in bar5()\n";

/*
 * ======== code injections ========
 */

 #include <stdlib.h> 

/*
 * ======== function definitions ========
 */

void test52_HelloWorld_Inner_foo__I( test52_HelloWorld_Inner_ this ) {
}

void test52_HelloWorld_foo__I( uint8 p ) {
    test52_HelloWorld_pollen__printStr((string)test52_HelloWorld__s__1);
}

bool test52_HelloWorld_start__I( struct test52_Event*  e ) {
    return(  true  );
}

void test52_HelloWorld_handle__E( uint8 id ) {
    uint8 x;
    x = 3;
}

void test52_HelloWorld_fcnrefsCalls__I() {
    uint8 rtn;
    uint8 i;
    test52_HelloWorld_pollen__printStr((string)test52_HelloWorld__s__9);
    rtn = test52_HelloWorld_bar4_uint32_and_rtn__V(3);
    (rtn) = test52_HelloWorld_foo2_uint32_rtn__V(1);
    (test52_HelloWorld_foo2_uint32_rtn__V) = (test52_HelloWorld_bar4_uint32_and_rtn__V);
    test52_HelloWorld_foo_uint8__V(1);
    i = test52_HelloWorld_bar5_uint16_and_rtn__V(2);
    test52_HelloWorld_pollen__printStr((string)test52_HelloWorld__s__10);
}

void test52_HelloWorld_testFcns__I() {
    test52_HelloWorld_fcnrefsParameters__I((test52_HelloWorld_bar_uint8__V), (test52_HelloWorld_bar2_bool__V), (test52_HelloWorld_bar4_uint32_and_rtn__V), null, (test52_HelloWorld_modFcnRef__V));
}

test52_HelloWorld_Inner_ test52_HelloWorld_Inner_new___E( test52_HelloWorld_Inner_ this ) {
    return this;
}

void test52_HelloWorld_bar5__I( uint16 p ) {
    test52_HelloWorld_pollen__printStr((string)test52_HelloWorld__s__7);
}

void test52_HelloWorld_bar3__I( uint32 p ) {
    test52_HelloWorld_pollen__printStr((string)test52_HelloWorld__s__5);
}

uint8 test52_HelloWorld_bar4__I( uint8 p ) {
    test52_HelloWorld_pollen__printStr((string)test52_HelloWorld__s__6);
    return(  1  );
}

uint8 test52_HelloWorld_bar5_and_rtn__I( uint16 p ) {
    test52_HelloWorld_pollen__printStr((string)test52_HelloWorld__s__8);
    return(  1  );
}

void test52_HelloWorld_bar2__I( bool p ) {
    test52_HelloWorld_pollen__printStr((string)test52_HelloWorld__s__4);
}

void test52_HelloWorld_bar__I( uint8 p ) {
    test52_HelloWorld_pollen__printStr((string)test52_HelloWorld__s__3);
}

void test52_HelloWorld_pollen__run__E() {
    test52_HelloWorld_start__I((test52_HelloWorld_e1__V));
    test52_HelloWorld_start__I((test52_HelloWorld_e2__V));
    test52_HelloWorld_fcnrefsAssign__I();
    test52_HelloWorld_fcnrefsCalls__I();
    test52_HelloWorld_fcnrefsParameters__I((test52_HelloWorld_bar_uint8__V), (test52_HelloWorld_bar2_bool__V), (test52_HelloWorld_bar4_uint32_and_rtn__V), null, (test52_HelloWorld_modFcnRef__V));
     exit(0) ;

}

void test52_HelloWorld_fcnrefsParameters__I( test52_HelloWorld_bar b1, test52_HelloWorld_bar2 b2, test52_HelloWorld_bar4 b4, test52_HelloWorld_Inner_foo cf, test52_HelloWorld_FcnImpl_foo_proto mf ) {
    uint32 r;
    test52_HelloWorld_pollen__printStr((string)test52_HelloWorld__s__11);
    b1(1);
    b2(true);
    
    (r) = b4(5);
    mf(3);
    test52_HelloWorld_pollen__printStr((string)test52_HelloWorld__s__12);
}

void test52_HelloWorld_fcnrefsAssign__I() {
    (test52_HelloWorld_foo_uint8__V) = (test52_HelloWorld_bar_uint8__V);
    (test52_HelloWorld_foo_uint8__V) = (test52_HelloWorld_bar2_bool__V);
    (test52_HelloWorld_foo_uint8__V) = (test52_HelloWorld_bar3_uint32__V);
    (test52_HelloWorld_foo_uint8__V) = (test52_HelloWorld_bar5_uint16__V);
    (test52_HelloWorld_foo_uint8__V) = (test52_HelloWorld_bar4_uint32_and_rtn__V);
    (test52_HelloWorld_bar3_uint32__V) = (test52_HelloWorld_bar4_uint32_and_rtn__V);
    (test52_HelloWorld_bar5_uint16__V) = (test52_HelloWorld_bar5_and_rtn__I);
    (test52_HelloWorld_bar5_uint16_and_rtn__V) = (test52_HelloWorld_bar5_and_rtn__I);
}

uint8 test52_HelloWorld_foo2__I( uint8 p ) {
    test52_HelloWorld_pollen__printStr((string)test52_HelloWorld__s__2);
    return(  2  );
}

void test52_HelloWorld_targetInit__I() {
}

