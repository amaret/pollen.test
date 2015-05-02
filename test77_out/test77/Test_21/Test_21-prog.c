#include <std.h>


/*
 * ======== protocol member pollen.event.Newsroom.GI delegates virtual_mcu_GlobalInterrupts ========
 */

#ifndef virtual_mcu_GlobalInterrupts__M
#define virtual_mcu_GlobalInterrupts__M
#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif


/*
 * ======== protocol member pollen.time.TimerManager.HwTimer delegates virtual_mcu_TimerMilli ========
 */

#ifndef virtual_mcu_TimerMilli__M
#define virtual_mcu_TimerMilli__M
#include "../../virtual.mcu/TimerMilli/TimerMilli.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef virtual_mcu_GlobalInterrupts__M
#define virtual_mcu_GlobalInterrupts__M
#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef virtual_mcu_TimerMilli__M
#define virtual_mcu_TimerMilli__M
#include "../../virtual.mcu/TimerMilli/TimerMilli.h"
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

#ifndef pollen_time_TimerManager__M
#define pollen_time_TimerManager__M
#include "../../pollen.time/TimerManager/TimerManager.h"
#endif

#ifndef pollen_time_Timer__M
#define pollen_time_Timer__M
#include "../../pollen.time/Timer/Timer.h"
#endif

#ifndef test77_Test_21__M
#define test77_Test_21__M
#include "../../test77/Test_21/Test_21.h"
#endif


/*
 * ======== target data definitions (unit GlobalInterrupts) ========
 */

struct virtual_mcu_GlobalInterrupts_ virtual_mcu_GlobalInterrupts = { /* module data */
};

/*
 * ======== target data definitions (unit TimerMilli) ========
 */

struct virtual_mcu_TimerMilli_ virtual_mcu_TimerMilli = { /* module data */
    pollen_time_TimerManager_tickISR__I,    /* tickHandler */
    false,                   /* repeat */
};

/*
 * ======== host data definitions (unit Newsroom) ========
 */

pollen_event_Newsroom_events__TYPE pollen_event_Newsroom_events__V = /* pollen.event.EventQueue object init */
{
    (uint8)0x3,              /* capacity */
    {
        null,  /* [0] */
        null,  /* [1] */
        null,  /* [2] */
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
 * ======== host data definitions (unit TimerManager) ========
 */

const pollen_time_TimerManager_numMsTimers__TYPE pollen_time_TimerManager_numMsTimers__V = (uint8)0x3;

/*
 * ======== target data definitions (unit TimerManager) ========
 */

struct pollen_time_TimerManager_ pollen_time_TimerManager = { /* module data */
    &virtual_mcu_TimerMilli,    /* HwTimer */
    {
        null,  /* [0] */
        null,  /* [1] */
        null,  /* [2] */
    },    /* msTimers */
};

/*
 * ======== host data definitions (unit Test_21) ========
 */

test77_Test_21_t1__TYPE test77_Test_21_t1__V = /* pollen.time.Timer object init */
{
    /* pollen.event.Event object init */
    {
        test77_Test_21_tick1__I,    /* eventHandler */
    },                        /* tickEvent */
    false,                   /* active */
    false,                   /* periodic */
    (uint16)0x0,             /* duration */
    (uint16)0x0,             /* tickCount */
};
test77_Test_21_t2__TYPE test77_Test_21_t2__V = /* pollen.time.Timer object init */
{
    /* pollen.event.Event object init */
    {
        test77_Test_21_tick2__I,    /* eventHandler */
    },                        /* tickEvent */
    false,                   /* active */
    false,                   /* periodic */
    (uint16)0x0,             /* duration */
    (uint16)0x0,             /* tickCount */
};
test77_Test_21_t3__TYPE test77_Test_21_t3__V = /* pollen.time.Timer object init */
{
    /* pollen.event.Event object init */
    {
        test77_Test_21_tick3__I,    /* eventHandler */
    },                        /* tickEvent */
    false,                   /* active */
    false,                   /* periodic */
    (uint16)0x0,             /* duration */
    (uint16)0x0,             /* tickCount */
};

/*
 * ======== target data definitions (unit Test_21) ========
 */

struct test77_Test_21_ test77_Test_21 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test77_Test_21_pollen__printBool(bool b) {
}
void test77_Test_21_pollen__printInt(int32 i) {
}
void test77_Test_21_pollen__printReal(float f) {
}
void test77_Test_21_pollen__printUint(uint32 u) {
}
void test77_Test_21_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../virtual.mcu/GlobalInterrupts/GlobalInterrupts.c"
#include "../../virtual.mcu/TimerMilli/TimerMilli.c"
#include "../../pollen.event/Event/Event.c"
#include "../../pollen.event/EventQueue/EventQueue.c"
#include "../../pollen.event/Newsroom/Newsroom.c"
#include "../../pollen.time/TimerManager/TimerManager.c"
#include "../../pollen.time/Timer/Timer.c"
#include "../../test77/Test_21/Test_21.c"

/*
 * ======== pollen.reset() ========
 */

void test77_Test_21_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test77_Test_21_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test77_Test_21_pollen__reset__E();
    virtual_mcu_GlobalInterrupts_targetInit__I();
    virtual_mcu_TimerMilli_targetInit__I();
    pollen_event_Newsroom_targetInit__I();
    pollen_time_TimerManager_targetInit__I();
    test77_Test_21_targetInit__I();
    test77_Test_21_pollen__ready__E();
    test77_Test_21_pollen__run__E();
    test77_Test_21_pollen__shutdown__E(0);
}
