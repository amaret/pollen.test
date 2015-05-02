
/*
 * ======== imports ========
 */

#ifndef mcu_atmel_atmega328p_Atmega328p__M
#define mcu_atmel_atmega328p_Atmega328p__M
#include "../../mcu.atmel.atmega328p/Atmega328p/Atmega328p.h"
#endif

#ifndef mcu_atmel_atmega_Timer0MatchA__M
#define mcu_atmel_atmega_Timer0MatchA__M
#include "../../mcu.atmel.atmega/Timer0MatchA/Timer0MatchA.h"
#endif

#ifndef mcu_atmel_atmega328p_Uart__M
#define mcu_atmel_atmega328p_Uart__M
#include "../../mcu.atmel.atmega328p/Uart/Uart.h"
#endif

#ifndef pollen_parts_Led__M
#define pollen_parts_Led__M
#include "../../pollen.parts/Led/Led.h"
#endif

#ifndef pollen_events_Dispatcher__M
#define pollen_events_Dispatcher__M
#include "../../pollen.events/Dispatcher/Dispatcher.h"
#endif

#ifndef pollen_time_TimerMilli__M
#define pollen_time_TimerMilli__M
#include "../../pollen.time/TimerMilli/TimerMilli.h"
#endif

#ifndef pollen_time_TimerManager__M
#define pollen_time_TimerManager__M
#include "../../pollen.time/TimerManager/TimerManager.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test17_TimerManagerTest_pollen__reset__E();
void test17_TimerManagerTest_pollen__ready__E();
void test17_TimerManagerTest_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test17_TimerManagerTest_ test17_TimerManagerTest;

/*
 * ======== struct module definition (unit TimerManagerTest) ========
 */

struct test17_TimerManagerTest_ {
};
typedef struct test17_TimerManagerTest_ test17_TimerManagerTest_;

/*
 * ======== host variables (unit TimerManagerTest) ========
 */

typedef struct pollen_time_TimerManager_Timer test17_TimerManagerTest_t__TYPE;
extern test17_TimerManagerTest_t__TYPE test17_TimerManagerTest_t__V;

/*
 * ======== function members (unit TimerManagerTest) ========
 */

extern void test17_TimerManagerTest_pollen__run__E();
extern void test17_TimerManagerTest_targetInit__I();


/*
 * ======== data members (unit TimerManagerTest) ========
 */

#define test17_TimerManagerTest_t__V test17_TimerManagerTest_t
