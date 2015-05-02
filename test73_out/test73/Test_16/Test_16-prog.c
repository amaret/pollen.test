#include <std.h>


/*
 * ======== protocol member pollen.event.Newsroom.GI delegates virtual_mcu_GlobalInterrupts ========
 */

#ifndef virtual_mcu_GlobalInterrupts__M
#define virtual_mcu_GlobalInterrupts__M
#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef virtual_mcu_GlobalInterrupts__M
#define virtual_mcu_GlobalInterrupts__M
#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef virtual_mcu_ConsolePrint__M
#define virtual_mcu_ConsolePrint__M
#include "../../virtual.mcu/ConsolePrint/ConsolePrint.h"
#endif

#ifndef pollen_event_Event__M
#define pollen_event_Event__M
#include "../../pollen.event/Event/Event.h"
#endif

#ifndef pollen_event_EventQueue__M
#define pollen_event_EventQueue__M
#include "../../pollen.event/EventQueue/EventQueue.h"
#endif

#ifndef pollen_event_Newsroom__M
#define pollen_event_Newsroom__M
#include "../../pollen.event/Newsroom/Newsroom.h"
#endif

#ifndef test73_Test_16__M
#define test73_Test_16__M
#include "../../test73/Test_16/Test_16.h"
#endif


/*
 * ======== target data definitions (unit GlobalInterrupts) ========
 */

struct virtual_mcu_GlobalInterrupts_ virtual_mcu_GlobalInterrupts = { /* module data */
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
 * ======== host data definitions (unit Newsroom) ========
 */

pollen_event_Newsroom_events__TYPE pollen_event_Newsroom_events__V = /* pollen.event.EventQueue object init */
{
    (uint8)0x2,              /* capacity */
    {
        null,  /* [0] */
        null,  /* [1] */
    },    /* elements */
    (uint8)0x0,              /* length */
    (uint8)0x0,              /* head */
    (uint8)0x0,              /* tail */
};

/*
 * ======== target data definitions (unit Newsroom) ========
 */

struct pollen_event_Newsroom_ pollen_event_Newsroom = { /* module data */
    &virtual_mcu_GlobalInterrupts,    /* GI */
};

/*
 * ======== host data definitions (unit Test_16) ========
 */

test73_Test_16_e1__TYPE test73_Test_16_e1__V = /* pollen.event.Event object init */
{
    test73_Test_16_tick1__I,    /* eventHandler */
};
test73_Test_16_e2__TYPE test73_Test_16_e2__V = /* pollen.event.Event object init */
{
    test73_Test_16_tick2__I,    /* eventHandler */
};

/*
 * ======== target data definitions (unit Test_16) ========
 */

struct test73_Test_16_ test73_Test_16 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test73_Test_16_pollen__printBool(bool b) {
}
void test73_Test_16_pollen__printInt(int32 i) {
}
void test73_Test_16_pollen__printReal(float f) {
}
void test73_Test_16_pollen__printUint(uint32 u) {
}
void test73_Test_16_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.c"
#include "../../virtual.mcu/ConsolePrint/ConsolePrint.c"
#include "../../pollen.event/Event/Event.c"
#include "../../pollen.event/EventQueue/EventQueue.c"
#include "../../pollen.event/Newsroom/Newsroom.c"
#include "../../test73/Test_16/Test_16.c"

/*
 * ======== pollen.reset() ========
 */

void test73_Test_16_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test73_Test_16_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test73_Test_16_pollen__reset__E();
    virtual_mcu_GlobalInterrupts_targetInit__I();
    virtual_mcu_ConsolePrint_targetInit__I();
    pollen_event_Newsroom_targetInit__I();
    test73_Test_16_targetInit__I();
    test73_Test_16_pollen__ready__E();
    test73_Test_16_pollen__run__E();
    test73_Test_16_pollen__shutdown__E(0);
}
