#include <std.h>


/*
 * ======== protocol member pollen.event.Dispatcher.GI delegates virtual_mcu_GlobalInterrupts ========
 */

#ifndef virtual_mcu_GlobalInterrupts__M
#define virtual_mcu_GlobalInterrupts__M
#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif


/*
 * ======== protocol member test85.Test_11.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef pollen_event_Event__M
#define pollen_event_Event__M
#include "../../pollen.event/Event/Event.h"
#endif

#ifndef pollen_event_EventQueue__M
#define pollen_event_EventQueue__M
#include "../../pollen.event/EventQueue/EventQueue.h"
#endif

#ifndef pollen_event_Dispatcher__M
#define pollen_event_Dispatcher__M
#include "../../pollen.event/Dispatcher/Dispatcher.h"
#endif

#ifndef virtual_mcu_ConsolePrint__M
#define virtual_mcu_ConsolePrint__M
#include "../../virtual.mcu/ConsolePrint/ConsolePrint.h"
#endif

#ifndef virtual_mcu_GlobalInterrupts__M
#define virtual_mcu_GlobalInterrupts__M
#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test85_Test_11__M
#define test85_Test_11__M
#include "../../test85/Test_11/Test_11.h"
#endif


/*
 * ======== host data definitions (unit Dispatcher) ========
 */

const pollen_event_Dispatcher_capacity__TYPE pollen_event_Dispatcher_capacity__V = (uint8)0x5;
pollen_event_Dispatcher_events__TYPE pollen_event_Dispatcher_events__V = /* pollen.event.EventQueue object init */
{
    (const uint8)0xa,    /* capacity */
    {
        null,  /* [0] */
        null,  /* [1] */
        null,  /* [2] */
        null,  /* [3] */
        null,  /* [4] */
        null,  /* [5] */
        null,  /* [6] */
        null,  /* [7] */
        null,  /* [8] */
        null,  /* [9] */
    },    /* elements */
    (uint8)0x0,              /* length */
    (uint8)0x0,              /* head */
    (uint8)0x0,              /* tail */
    (uint8)0x5,              /* maxLength */
};

/*
 * ======== target data definitions (unit Dispatcher) ========
 */

struct pollen_event_Dispatcher_ pollen_event_Dispatcher = { /* module data */
    &virtual_mcu_GlobalInterrupts,    /* GI */
};

/*
 * ======== target data definitions (unit ConsolePrint) ========
 */

struct virtual_mcu_ConsolePrint_ virtual_mcu_ConsolePrint = { /* module data */
    "[95m",                 /* HEADER */
    "[94m",                 /* OKBLUE */
    "[92m",                 /* OKGREEN */
    "[93m",                 /* WARNING */
    "[91m",                 /* FAIL */
    "[0m",                  /* ENDC */
};

/*
 * ======== target data definitions (unit GlobalInterrupts) ========
 */

struct virtual_mcu_GlobalInterrupts_ virtual_mcu_GlobalInterrupts = { /* module data */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit Test_11) ========
 */

test85_Test_11_events__TYPE test85_Test_11_events__A[] = {
    /* pollen.event.Event object init */
    {
        test85_Test_11_tick1__I,    /* eventHandler */
    },  /* [0] */
    /* pollen.event.Event object init */
    {
        test85_Test_11_tick2__I,    /* eventHandler */
    },  /* [1] */
    /* pollen.event.Event object init */
    {
        test85_Test_11_tick3__I,    /* eventHandler */
    },  /* [2] */
    /* pollen.event.Event object init */
    {
        test85_Test_11_tick4__I,    /* eventHandler */
    },  /* [3] */
    /* pollen.event.Event object init */
    {
        test85_Test_11_tick5__I,    /* eventHandler */
    },  /* [4] */
};

/*
 * ======== target data definitions (unit Test_11) ========
 */

struct test85_Test_11_ test85_Test_11 = { /* module data */
    (const uint8)0x5,    /* NumEvents */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test85_Test_11_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test85_Test_11_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test85_Test_11_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test85_Test_11_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test85_Test_11_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../pollen.event/Event/Event.c"
#include "../../pollen.event/EventQueue/EventQueue.c"
#include "../../pollen.event/Dispatcher/Dispatcher.c"
#include "../../virtual.mcu/ConsolePrint/ConsolePrint.c"
#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test85/Test_11/Test_11.c"

/*
 * ======== pollen.reset() ========
 */

void test85_Test_11_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test85_Test_11_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test85_Test_11_pollen__reset__E();
    pollen_event_Dispatcher_targetInit__I();
    virtual_mcu_ConsolePrint_targetInit__I();
    virtual_mcu_GlobalInterrupts_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test85_Test_11_targetInit__I();
    test85_Test_11_pollen__ready__E();
    test85_Test_11_pollen__run__E();
    test85_Test_11_pollen__shutdown__E(0);
}
