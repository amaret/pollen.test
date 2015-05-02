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

#ifndef test_virtual_TestClass__M
#define test_virtual_TestClass__M
#include "../../test.virtual/TestClass/TestClass.h"
#endif

#ifndef test74_Test_20__M
#define test74_Test_20__M
#include "../../test74/Test_20/Test_20.h"
#endif


/*
 * ======== target data definitions (unit GlobalInterrupts) ========
 */

struct virtual_mcu_GlobalInterrupts_ virtual_mcu_GlobalInterrupts = { /* module data */
};

/*
 * ======== host data definitions (unit Newsroom) ========
 */

pollen_event_Newsroom_events__TYPE pollen_event_Newsroom_events__V = /* pollen.event.EventQueue object init */
{
    (uint8)0x1,              /* capacity */
    {
        null,  /* [0] */
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
 * ======== host data definitions (unit Test_20) ========
 */

test74_Test_20_tc__TYPE test74_Test_20_tc__V = /* test.virtual.TestClass object init */
{
    /* pollen.event.Event object init */
    {
        test74_Test_20_testHandler__I,    /* eventHandler */
    },                        /* e */
};

/*
 * ======== target data definitions (unit Test_20) ========
 */

struct test74_Test_20_ test74_Test_20 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test74_Test_20_pollen__printBool(bool b) {
}
void test74_Test_20_pollen__printInt(int32 i) {
}
void test74_Test_20_pollen__printReal(float f) {
}
void test74_Test_20_pollen__printUint(uint32 u) {
}
void test74_Test_20_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.c"
#include "../../pollen.event/Event/Event.c"
#include "../../pollen.event/EventQueue/EventQueue.c"
#include "../../pollen.event/Newsroom/Newsroom.c"
#include "../../test.virtual/TestClass/TestClass.c"
#include "../../test74/Test_20/Test_20.c"

/*
 * ======== pollen.reset() ========
 */

void test74_Test_20_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test74_Test_20_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test74_Test_20_pollen__reset__E();
    virtual_mcu_GlobalInterrupts_targetInit__I();
    pollen_event_Newsroom_targetInit__I();
    test74_Test_20_targetInit__I();
    test74_Test_20_pollen__ready__E();
    test74_Test_20_pollen__run__E();
    test74_Test_20_pollen__shutdown__E(0);
}
