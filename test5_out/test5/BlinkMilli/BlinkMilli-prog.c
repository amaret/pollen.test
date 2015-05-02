#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef mcu_atmel_atmega328p_Atmega328p__M
#define mcu_atmel_atmega328p_Atmega328p__M
#include "../../mcu.atmel.atmega328p/Atmega328p/Atmega328p.h"
#endif

#ifndef mcu_atmel_atmega_Timer0MatchA__M
#define mcu_atmel_atmega_Timer0MatchA__M
#include "../../mcu.atmel.atmega/Timer0MatchA/Timer0MatchA.h"
#endif

#ifndef pollen_parts_Led__M
#define pollen_parts_Led__M
#include "../../pollen.parts/Led/Led.h"
#endif

#ifndef pollen_time_TimerMilli__M
#define pollen_time_TimerMilli__M
#include "../../pollen.time/TimerMilli/TimerMilli.h"
#endif

#ifndef pollen_events_AE__M
#define pollen_events_AE__M
#include "../../pollen.events/AE/AE.h"
#endif

#ifndef pollen_data_AEQueue__M
#define pollen_data_AEQueue__M
#include "../../pollen.data/AEQueue/AEQueue.h"
#endif

#ifndef pollen_events_Dispatcher__M
#define pollen_events_Dispatcher__M
#include "../../pollen.events/Dispatcher/Dispatcher.h"
#endif

#ifndef test5_BlinkMilli__M
#define test5_BlinkMilli__M
#include "../../test5/BlinkMilli/BlinkMilli.h"
#endif


/*
 * ======== target data definitions (unit Atmega328p) ========
 */

struct mcu_atmel_atmega328p_Atmega328p_ mcu_atmel_atmega328p_Atmega328p = { /* module data */
    (uint32)0x0,             /* sysFreq */
};

/*
 * ======== target data definitions (unit Timer0MatchA) ========
 */

struct mcu_atmel_atmega_Timer0MatchA_ mcu_atmel_atmega_Timer0MatchA = { /* module data */
    null,                    /* h */
};

/*
 * ======== target data definitions (unit Led) ========
 */

struct pollen_parts_Led_ pollen_parts_Led = { /* module data */
    null,                    /* Gpio */
};

/*
 * ======== target data definitions (unit TimerMilli) ========
 */

struct pollen_time_TimerMilli_ pollen_time_TimerMilli = { /* module data */
    (uint16)0x0,             /* count */
    (uint16)0x0,             /* duration */
    true,                    /* repeat */
    null,                    /* clientTick */
};

/*
 * ======== target data definitions (unit Dispatcher) ========
 */

struct pollen_events_Dispatcher_ pollen_events_Dispatcher = { /* module data */
};

/*
 * ======== target data definitions (unit BlinkMilli) ========
 */

struct test5_BlinkMilli_ test5_BlinkMilli = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test5_BlinkMilli_pollen__printBool(bool b) {
}
void test5_BlinkMilli_pollen__printInt(int32 i) {
}
void test5_BlinkMilli_pollen__printReal(float f) {
}
void test5_BlinkMilli_pollen__printUint(uint32 u) {
}
void test5_BlinkMilli_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../mcu.atmel.atmega328p/Atmega328p/Atmega328p.c"
#include "../../mcu.atmel.atmega/Timer0MatchA/Timer0MatchA.c"
#include "../../pollen.parts/Led/Led.c"
#include "../../pollen.time/TimerMilli/TimerMilli.c"
#include "../../pollen.events/AE/AE.c"
#include "../../pollen.data/AEQueue/AEQueue.c"
#include "../../pollen.events/Dispatcher/Dispatcher.c"
#include "../../test5/BlinkMilli/BlinkMilli.c"

/*
 * ======== pollen.ready() ========
 */

void test5_BlinkMilli_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test5_BlinkMilli_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test5_BlinkMilli_pollen__reset__E();
    mcu_atmel_atmega328p_Atmega328p_targetInit__I();
    mcu_atmel_atmega_Timer0MatchA_targetInit__I();
    pollen_parts_Led_targetInit__I();
    pollen_time_TimerMilli_targetInit__I();
    pollen_events_Dispatcher_targetInit__I();
    test5_BlinkMilli_targetInit__I();
    test5_BlinkMilli_pollen__ready__E();
    test5_BlinkMilli_pollen__run__E();
    test5_BlinkMilli_pollen__shutdown__E(0);
}
