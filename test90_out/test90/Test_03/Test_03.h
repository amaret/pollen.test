
/*
 * ======== imports ========
 */

#ifndef local_mcu_TimerMilli__M
#define local_mcu_TimerMilli__M
#include "../../local.mcu/TimerMilli/TimerMilli.h"
#endif

#ifndef local_mcu_GlobalInterrupts__M
#define local_mcu_GlobalInterrupts__M
#include "../../local.mcu/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef local_mcu_ConsolePrint__M
#define local_mcu_ConsolePrint__M
#include "../../local.mcu/ConsolePrint/ConsolePrint.h"
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

#ifndef pollen_event_Newsroom__M
#define pollen_event_Newsroom__M
#include "../../pollen.event/Newsroom/Newsroom.h"
#endif

#ifndef pollen_time_TimerManager__M
#define pollen_time_TimerManager__M
#include "../../pollen.time/TimerManager/TimerManager.h"
#endif

#ifndef localhost_Lifecycle__M
#define localhost_Lifecycle__M
#include "../../localhost/Lifecycle/Lifecycle.h"
#endif

#ifndef pollen_time_Timer__M
#define pollen_time_Timer__M
#include "../../pollen.time/Timer/Timer.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void localhost_Lifecycle_pollen__reset__E();
void localhost_Lifecycle_pollen__ready__E();
void localhost_Lifecycle_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test90_Test_03_ test90_Test_03;

/*
 * ======== struct module definition (unit Test_03) ========
 */

struct pollen_time_Timer;
struct test54_PrintImpl_;
struct test90_Test_03_ {
    uint32 count;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test90_Test_03_ test90_Test_03_;

/*
 * ======== host variables (unit Test_03) ========
 */

typedef struct pollen_time_Timer test90_Test_03_t1__TYPE;
extern test90_Test_03_t1__TYPE test90_Test_03_t1__V;

/*
 * ======== function members (unit Test_03) ========
 */

extern void test90_Test_03_pollen__run__E();
extern void test90_Test_03_tick__I();
extern void test90_Test_03_targetInit__I();


/*
 * ======== data members (unit Test_03) ========
 */

#define test90_Test_03_t1__V test90_Test_03_t1
#define test90_Test_03_count__V test90_Test_03.count
#define test90_Test_03_pollenPrintProxy__V test90_Test_03.pollenPrintProxy
