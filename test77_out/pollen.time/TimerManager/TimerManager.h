
/*
 * ======== imports ========
 */

#ifndef pollen_time_Timer__M
#define pollen_time_Timer__M
#include "../../pollen.time/Timer/Timer.h"
#endif

#ifndef virtual_mcu_TimerMilli__M
#define virtual_mcu_TimerMilli__M
#include "../../virtual.mcu/TimerMilli/TimerMilli.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test77_Test_21_pollen__reset__E();
void test77_Test_21_pollen__ready__E();
void test77_Test_21_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_time_TimerManager_ pollen_time_TimerManager;

/*
 * ======== struct module definition (unit TimerManager) ========
 */

struct virtual_mcu_TimerMilli_;
struct pollen_time_Timer;
struct pollen_time_TimerManager_ {
    struct virtual_mcu_TimerMilli_ *HwTimer;
    struct pollen_time_Timer*  msTimers[3] /* numMsTimers */;
};
typedef struct pollen_time_TimerManager_ pollen_time_TimerManager_;

/*
 * ======== host variables (unit TimerManager) ========
 */

typedef uint8 pollen_time_TimerManager_numMsTimers__TYPE;
extern const pollen_time_TimerManager_numMsTimers__TYPE pollen_time_TimerManager_numMsTimers__V;

/*
 * ======== function members (unit TimerManager) ========
 */

extern bool pollen_time_TimerManager_addTimer__E( struct pollen_time_Timer*  t );
extern void pollen_time_TimerManager_stop__E();
extern void pollen_time_TimerManager_start__E();
extern bool pollen_time_TimerManager_isActive__E();
extern void pollen_time_TimerManager_targetInit__I();
extern void pollen_time_TimerManager_tickISR__I();


/*
 * ======== data members (unit TimerManager) ========
 */

#define pollen_time_TimerManager_HwTimer__V pollen_time_TimerManager.HwTimer
#define pollen_time_TimerManager_msTimers__A pollen_time_TimerManager.msTimers
