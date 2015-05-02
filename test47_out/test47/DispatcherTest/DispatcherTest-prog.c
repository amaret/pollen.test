#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test47_Ev__M
#define test47_Ev__M
#include "../../test47/Ev/Ev.h"
#endif

#ifndef test47_EvQueue__M
#define test47_EvQueue__M
#include "../../test47/EvQueue/EvQueue.h"
#endif

#ifndef test47_Dispatcher__M
#define test47_Dispatcher__M
#include "../../test47/Dispatcher/Dispatcher.h"
#endif

#ifndef test47_DispatcherTest__M
#define test47_DispatcherTest__M
#include "../../test47/DispatcherTest/DispatcherTest.h"
#endif


/*
 * ======== host data definitions (unit Dispatcher) ========
 */

test47_Dispatcher_myEventQueue__TYPE test47_Dispatcher_myEventQueue__V = /* test47.EvQueue object init */
{
    (const uint8)0xa,    /* capacity */
    {
        /* test47.Ev object init */
        {
            (uint8)0x0,              /* priority */
            null,                    /* handler */
            (uint8)0x0,              /* data */
        },  /* [0] */
        /* test47.Ev object init */
        {
            (uint8)0x0,              /* priority */
            null,                    /* handler */
            (uint8)0x0,              /* data */
        },  /* [1] */
        /* test47.Ev object init */
        {
            (uint8)0x0,              /* priority */
            null,                    /* handler */
            (uint8)0x0,              /* data */
        },  /* [2] */
        /* test47.Ev object init */
        {
            (uint8)0x0,              /* priority */
            null,                    /* handler */
            (uint8)0x0,              /* data */
        },  /* [3] */
        /* test47.Ev object init */
        {
            (uint8)0x0,              /* priority */
            null,                    /* handler */
            (uint8)0x0,              /* data */
        },  /* [4] */
        /* test47.Ev object init */
        {
            (uint8)0x0,              /* priority */
            null,                    /* handler */
            (uint8)0x0,              /* data */
        },  /* [5] */
        /* test47.Ev object init */
        {
            (uint8)0x0,              /* priority */
            null,                    /* handler */
            (uint8)0x0,              /* data */
        },  /* [6] */
        /* test47.Ev object init */
        {
            (uint8)0x0,              /* priority */
            null,                    /* handler */
            (uint8)0x0,              /* data */
        },  /* [7] */
        /* test47.Ev object init */
        {
            (uint8)0x0,              /* priority */
            null,                    /* handler */
            (uint8)0x0,              /* data */
        },  /* [8] */
        /* test47.Ev object init */
        {
            (uint8)0x0,              /* priority */
            null,                    /* handler */
            (uint8)0x0,              /* data */
        },  /* [9] */
    },                        /* elements */
    (uint8)0x0,              /* length */
    (uint8)0x0,              /* head */
    (uint8)0x0,              /* tail */
    (uint8)0xa,              /* maxLength */
};

/*
 * ======== target data definitions (unit Dispatcher) ========
 */

struct test47_Dispatcher_ test47_Dispatcher = { /* module data */
};

/*
 * ======== host data definitions (unit DispatcherTest) ========
 */

test47_DispatcherTest_e1__TYPE test47_DispatcherTest_e1__V = /* test47.Ev object init */
{
    (uint8)0x0,              /* priority */
    null,                    /* handler */
    (uint8)0x0,              /* data */
};
test47_DispatcherTest_e2__TYPE test47_DispatcherTest_e2__V = /* test47.Ev object init */
{
    (uint8)0x0,              /* priority */
    null,                    /* handler */
    (uint8)0x0,              /* data */
};
test47_DispatcherTest_e3__TYPE test47_DispatcherTest_e3__V = /* test47.Ev object init */
{
    (uint8)0x0,              /* priority */
    null,                    /* handler */
    (uint8)0x0,              /* data */
};

/*
 * ======== target data definitions (unit DispatcherTest) ========
 */

struct test47_DispatcherTest_ test47_DispatcherTest = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test47_DispatcherTest_pollen__printBool(bool b) {
}
void test47_DispatcherTest_pollen__printInt(int32 i) {
}
void test47_DispatcherTest_pollen__printReal(float f) {
}
void test47_DispatcherTest_pollen__printUint(uint32 u) {
}
void test47_DispatcherTest_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test47/Ev/Ev.c"
#include "../../test47/EvQueue/EvQueue.c"
#include "../../test47/Dispatcher/Dispatcher.c"
#include "../../test47/DispatcherTest/DispatcherTest.c"

/*
 * ======== pollen.reset() ========
 */

void test47_DispatcherTest_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test47_DispatcherTest_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test47_DispatcherTest_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test47_DispatcherTest_pollen__reset__E();
    test47_Dispatcher_targetInit__I();
    test47_DispatcherTest_targetInit__I();
    test47_DispatcherTest_pollen__ready__E();
    test47_DispatcherTest_pollen__run__E();
    test47_DispatcherTest_pollen__shutdown__E(0);
}
