#include <std.h>


/*
 * ======== protocol member pollen.parts.Led0.pin delegates local_mcu_Pin0 ========
 */

#ifndef local_mcu_Pin0__M
#define local_mcu_Pin0__M
#include "../../local.mcu/Pin0/Pin0.h"
#endif


/*
 * ======== protocol member pollen.parts.Led1.pin delegates local_mcu_Pin1 ========
 */

#ifndef local_mcu_Pin1__M
#define local_mcu_Pin1__M
#include "../../local.mcu/Pin1/Pin1.h"
#endif


/*
 * ======== protocol member pollen.parts.Led2.pin delegates local_mcu_Pin2 ========
 */

#ifndef local_mcu_Pin2__M
#define local_mcu_Pin2__M
#include "../../local.mcu/Pin2/Pin2.h"
#endif


/*
 * ======== protocol member pollen.event.Newsroom.GI delegates local_mcu_GlobalInterrupts ========
 */

#ifndef local_mcu_GlobalInterrupts__M
#define local_mcu_GlobalInterrupts__M
#include "../../local.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif


/*
 * ======== protocol member pollen.time.TimerManager.hwTimer delegates local_mcu_TimerMilli ========
 */

#ifndef local_mcu_TimerMilli__M
#define local_mcu_TimerMilli__M
#include "../../local.mcu/TimerMilli/TimerMilli.h"
#endif


/*
 * ======== protocol member test90.Test_03.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef local_mcu_Cpu__M
#define local_mcu_Cpu__M
#include "../../local.mcu/Cpu/Cpu.h"
#endif

#ifndef local_mcu_GlobalInterrupts__M
#define local_mcu_GlobalInterrupts__M
#include "../../local.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef local_mcu_TimerMilli__M
#define local_mcu_TimerMilli__M
#include "../../local.mcu/TimerMilli/TimerMilli.h"
#endif

#ifndef local_mcu_Pin0__M
#define local_mcu_Pin0__M
#include "../../local.mcu/Pin0/Pin0.h"
#endif

#ifndef local_mcu_Pin1__M
#define local_mcu_Pin1__M
#include "../../local.mcu/Pin1/Pin1.h"
#endif

#ifndef local_mcu_Pin2__M
#define local_mcu_Pin2__M
#include "../../local.mcu/Pin2/Pin2.h"
#endif

#ifndef local_mcu_ConsolePrint__M
#define local_mcu_ConsolePrint__M
#include "../../local.mcu/ConsolePrint/ConsolePrint.h"
#endif

#ifndef pollen_math_Random8__M
#define pollen_math_Random8__M
#include "../../pollen.math/Random8/Random8.h"
#endif

#ifndef pollen_math_Random16__M
#define pollen_math_Random16__M
#include "../../pollen.math/Random16/Random16.h"
#endif

#ifndef bijou_parts_LedState__M
#define bijou_parts_LedState__M
#include "../../bijou.parts/LedState/LedState.h"
#endif

#ifndef pollen_text_Text__M
#define pollen_text_Text__M
#include "../../pollen.text/Text/Text.h"
#endif

#ifndef local_output_SendOsc__M
#define local_output_SendOsc__M
#include "../../local.output/SendOsc/SendOsc.h"
#endif

#ifndef local_parts_ColorLed__M
#define local_parts_ColorLed__M
#include "../../local.parts/ColorLed/ColorLed.h"
#endif

#ifndef pollen_parts_Led0__M
#define pollen_parts_Led0__M
#include "../../pollen.parts/Led0/Led0.h"
#endif

#ifndef pollen_parts_Led1__M
#define pollen_parts_Led1__M
#include "../../pollen.parts/Led1/Led1.h"
#endif

#ifndef pollen_parts_Led2__M
#define pollen_parts_Led2__M
#include "../../pollen.parts/Led2/Led2.h"
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

#ifndef pollen_time_Timer__M
#define pollen_time_Timer__M
#include "../../pollen.time/Timer/Timer.h"
#endif

#ifndef pollen_time_TimerManager__M
#define pollen_time_TimerManager__M
#include "../../pollen.time/TimerManager/TimerManager.h"
#endif

#ifndef localhost_Lifecycle__M
#define localhost_Lifecycle__M
#include "../../localhost/Lifecycle/Lifecycle.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test90_Test_03__M
#define test90_Test_03__M
#include "../../test90/Test_03/Test_03.h"
#endif


/*
 * ======== target data definitions (unit Cpu) ========
 */

struct local_mcu_Cpu_ local_mcu_Cpu = { /* module data */
    (uint32)0x0,             /* sysFreq */
};

/*
 * ======== target data definitions (unit GlobalInterrupts) ========
 */

struct local_mcu_GlobalInterrupts_ local_mcu_GlobalInterrupts = { /* module data */
    false,                   /* enabled */
};

/*
 * ======== target data definitions (unit TimerMilli) ========
 */

struct local_mcu_TimerMilli_ local_mcu_TimerMilli = { /* module data */
    pollen_time_TimerManager_tickISR__I,    /* tickHandler */
    false,                   /* repeat */
};

/*
 * ======== target data definitions (unit Pin0) ========
 */

struct local_mcu_Pin0_ local_mcu_Pin0 = { /* module data */
    null,                    /* name */
    (uint8)0x0,              /* num */
    (bool)0x0,               /* state */
    (bool)0x0,               /* input */
    "Pin0",                  /* pollen__unitname */
};

/*
 * ======== target data definitions (unit Pin1) ========
 */

struct local_mcu_Pin1_ local_mcu_Pin1 = { /* module data */
    null,                    /* name */
    (uint8)0x0,              /* num */
    (bool)0x0,               /* state */
    (bool)0x0,               /* input */
    "Pin1",                  /* pollen__unitname */
};

/*
 * ======== target data definitions (unit Pin2) ========
 */

struct local_mcu_Pin2_ local_mcu_Pin2 = { /* module data */
    null,                    /* name */
    (uint8)0x0,              /* num */
    (bool)0x0,               /* state */
    (bool)0x0,               /* input */
    "Pin2",                  /* pollen__unitname */
};

/*
 * ======== target data definitions (unit ConsolePrint) ========
 */

struct local_mcu_ConsolePrint_ local_mcu_ConsolePrint = { /* module data */
    "[95m",                 /* HEADER */
    "[94m",                 /* OKBLUE */
    "[92m",                 /* OKGREEN */
    "[93m",                 /* WARNING */
    "[91m",                 /* FAIL */
    "[0m",                  /* ENDC */
};

/*
 * ======== target data definitions (unit Random8) ========
 */

struct pollen_math_Random8_ pollen_math_Random8 = { /* module data */
    (uint8)0xac,             /* seed */
    (uint8)0xac,             /* lfsr */
    (uint8)0x0,              /* period */
};

/*
 * ======== target data definitions (unit Random16) ========
 */

struct pollen_math_Random16_ pollen_math_Random16 = { /* module data */
    (uint16)0xace1,          /* seed */
    (uint16)0xace1,          /* lfsr */
    (uint16)0x0,             /* period */
};

/*
 * ======== target data definitions (unit Text) ========
 */

struct pollen_text_Text_ pollen_text_Text = { /* module data */
};

/*
 * ======== target data definitions (unit SendOsc) ========
 */

struct local_output_SendOsc_ local_output_SendOsc = { /* module data */
    "oscsend 127.0.0.1 7000 /led/1 iii ",    /* header */
    {
        (byte)0x0,  /* [0] */
        (byte)0x0,  /* [1] */
        (byte)0x0,  /* [2] */
        (byte)0x0,  /* [3] */
        (byte)0x0,  /* [4] */
        (byte)0x0,  /* [5] */
        (byte)0x0,  /* [6] */
        (byte)0x0,  /* [7] */
        (byte)0x0,  /* [8] */
        (byte)0x0,  /* [9] */
        (byte)0x0,  /* [10] */
        (byte)0x0,  /* [11] */
        (byte)0x0,  /* [12] */
        (byte)0x0,  /* [13] */
        (byte)0x0,  /* [14] */
        (byte)0x0,  /* [15] */
        (byte)0x0,  /* [16] */
        (byte)0x0,  /* [17] */
        (byte)0x0,  /* [18] */
        (byte)0x0,  /* [19] */
        (byte)0x0,  /* [20] */
        (byte)0x0,  /* [21] */
        (byte)0x0,  /* [22] */
        (byte)0x0,  /* [23] */
        (byte)0x0,  /* [24] */
        (byte)0x0,  /* [25] */
        (byte)0x0,  /* [26] */
        (byte)0x0,  /* [27] */
        (byte)0x0,  /* [28] */
        (byte)0x0,  /* [29] */
        (byte)0x0,  /* [30] */
        (byte)0x0,  /* [31] */
        (byte)0x0,  /* [32] */
        (byte)0x0,  /* [33] */
        (byte)0x0,  /* [34] */
        (byte)0x0,  /* [35] */
        (byte)0x0,  /* [36] */
        (byte)0x0,  /* [37] */
        (byte)0x0,  /* [38] */
        (byte)0x0,  /* [39] */
        (byte)0x0,  /* [40] */
        (byte)0x0,  /* [41] */
        (byte)0x0,  /* [42] */
        (byte)0x0,  /* [43] */
        (byte)0x0,  /* [44] */
        (byte)0x0,  /* [45] */
        (byte)0x0,  /* [46] */
        (byte)0x0,  /* [47] */
        (byte)0x0,  /* [48] */
        (byte)0x0,  /* [49] */
    },    /* data */
};

/*
 * ======== host data definitions (unit ColorLed) ========
 */

local_parts_ColorLed_state__TYPE local_parts_ColorLed_state__V = /* bijou.parts.LedState object init */
{
    (uint8)0x0,              /* id */
    {
        (uint8)0x0,  /* [0] */
        (uint8)0x0,  /* [1] */
        (uint8)0x0,  /* [2] */
        (uint8)0x0,  /* [3] */
    },    /* rgba */
};

/*
 * ======== target data definitions (unit ColorLed) ========
 */

struct local_parts_ColorLed_ local_parts_ColorLed = { /* module data */
};

/*
 * ======== target data definitions (unit Led0) ========
 */

struct pollen_parts_Led0_ pollen_parts_Led0 = { /* module data */
    &local_mcu_Pin0,         /* pin */
};

/*
 * ======== target data definitions (unit Led1) ========
 */

struct pollen_parts_Led1_ pollen_parts_Led1 = { /* module data */
    &local_mcu_Pin1,         /* pin */
};

/*
 * ======== target data definitions (unit Led2) ========
 */

struct pollen_parts_Led2_ pollen_parts_Led2 = { /* module data */
    &local_mcu_Pin2,         /* pin */
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
    &local_mcu_GlobalInterrupts,    /* GI */
};

/*
 * ======== host data definitions (unit TimerManager) ========
 */

const pollen_time_TimerManager_numMsTimers__TYPE pollen_time_TimerManager_numMsTimers__V = (uint8)0x1;

/*
 * ======== target data definitions (unit TimerManager) ========
 */

struct pollen_time_TimerManager_ pollen_time_TimerManager = { /* module data */
    &local_mcu_TimerMilli,    /* hwTimer */
    {
        null,  /* [0] */
    },    /* msTimers */
};

/*
 * ======== target data definitions (unit Lifecycle) ========
 */

struct localhost_Lifecycle_ localhost_Lifecycle = { /* module data */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit Test_03) ========
 */

test90_Test_03_t1__TYPE test90_Test_03_t1__V = /* pollen.time.Timer object init */
{
    null,                    /* eventHandler */
    /* pollen.event.Event object init */
    {
        test90_Test_03_tick__I,    /* eventHandler */
    },                        /* tickEvent */
    false,                   /* active */
    false,                   /* periodic */
    (uint16)0x0,             /* duration */
    (uint16)0x0,             /* tickCount */
    false,                   /* added */
};

/*
 * ======== target data definitions (unit Test_03) ========
 */

struct test90_Test_03_ test90_Test_03 = { /* module data */
    (uint32)0x0,             /* count */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test90_Test_03_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test90_Test_03_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test90_Test_03_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test90_Test_03_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test90_Test_03_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../local.mcu/Cpu/Cpu.c"
#include "../../local.mcu/GlobalInterrupts/GlobalInterrupts.c"
#include "../../local.mcu/TimerMilli/TimerMilli.c"
#include "../../local.mcu/Pin0/Pin0.c"
#include "../../local.mcu/Pin1/Pin1.c"
#include "../../local.mcu/Pin2/Pin2.c"
#include "../../local.mcu/ConsolePrint/ConsolePrint.c"
#include "../../pollen.math/Random8/Random8.c"
#include "../../pollen.math/Random16/Random16.c"
#include "../../bijou.parts/LedState/LedState.c"
#include "../../pollen.text/Text/Text.c"
#include "../../local.output/SendOsc/SendOsc.c"
#include "../../local.parts/ColorLed/ColorLed.c"
#include "../../pollen.parts/Led0/Led0.c"
#include "../../pollen.parts/Led1/Led1.c"
#include "../../pollen.parts/Led2/Led2.c"
#include "../../pollen.event/Event/Event.c"
#include "../../pollen.event/EventQueue/EventQueue.c"
#include "../../pollen.event/Newsroom/Newsroom.c"
#include "../../pollen.time/Timer/Timer.c"
#include "../../pollen.time/TimerManager/TimerManager.c"
#include "../../localhost/Lifecycle/Lifecycle.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test90/Test_03/Test_03.c"

/*
 * ======== main() ========
 */

int main() {
    localhost_Lifecycle_pollen__reset__E();
    local_mcu_Cpu_targetInit__I();
    local_mcu_GlobalInterrupts_targetInit__I();
    local_mcu_TimerMilli_targetInit__I();
    local_mcu_Pin0_targetInit__I();
    local_mcu_Pin1_targetInit__I();
    local_mcu_Pin2_targetInit__I();
    local_mcu_ConsolePrint_targetInit__I();
    pollen_math_Random8_targetInit__I();
    pollen_math_Random16_targetInit__I();
    pollen_text_Text_targetInit__I();
    local_output_SendOsc_targetInit__I();
    local_parts_ColorLed_targetInit__I();
    pollen_parts_Led0_targetInit__E();
    pollen_parts_Led1_targetInit__E();
    pollen_parts_Led2_targetInit__E();
    pollen_event_Newsroom_targetInit__I();
    pollen_time_TimerManager_targetInit__I();
    localhost_Lifecycle_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test90_Test_03_targetInit__I();
    localhost_Lifecycle_pollen__ready__E();
    test90_Test_03_pollen__run__E();
    localhost_Lifecycle_pollen__shutdown__E(0);
}
