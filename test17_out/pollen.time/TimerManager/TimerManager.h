
/*
 * ======== imports ========
 */

#ifndef pollen_events_Dispatcher__M
#define pollen_events_Dispatcher__M
#include "../../pollen.events/Dispatcher/Dispatcher.h"
#endif

#ifndef pollen_events_Event__M
#define pollen_events_Event__M
#include "../../pollen.events/Event/Event.h"
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

extern struct pollen_time_TimerManager_ pollen_time_TimerManager;

/*
 * ======== class definition (unit TimerManager.Timer) ========
 */

struct pollen_events_Event;
struct pollen_time_TimerManager_Timer {
    uint8 id;
    struct pollen_events_Event*  expired;
    uint32 duration;
    uint32 elapsed;
    bool repeat;
};
typedef struct pollen_time_TimerManager_Timer pollen_time_TimerManager_Timer;
typedef struct pollen_time_TimerManager_Timer* pollen_time_TimerManager_Timer_;

/*
 * ======== struct module definition (unit TimerManager) ========
 */

struct pollen_interfaces_GlobalInterrupts_;
struct pollen_interfaces_TimerDriver_;
struct pollen_time_TimerManager_ {
    struct pollen_interfaces_GlobalInterrupts_ *gint;
    struct pollen_interfaces_TimerDriver_ *hw_timer;
    pollen_time_TimerManager_Timer_ timers[0];
};
typedef struct pollen_time_TimerManager_ pollen_time_TimerManager_;

/*
 * ======== host variables (unit TimerManager) ========
 */

typedef uint8 pollen_time_TimerManager_numTimers__TYPE;
extern const pollen_time_TimerManager_numTimers__TYPE pollen_time_TimerManager_numTimers__V;

/*
 * ======== function members (unit TimerManager) ========
 */

extern bool pollen_time_TimerManager_Timer_repeats__E( pollen_time_TimerManager_Timer_ this );
extern void pollen_time_TimerManager_Timer_start__E( pollen_time_TimerManager_Timer_ this, struct pollen_events_Event*  e, uint16 d, bool r );
extern pollen_time_TimerManager_Timer_ pollen_time_TimerManager_Timer_new___E( pollen_time_TimerManager_Timer_ this );
extern bool pollen_time_TimerManager_Timer_running__E( pollen_time_TimerManager_Timer_ this );
extern void pollen_time_TimerManager_Timer_setElapsed__E( pollen_time_TimerManager_Timer_ this, uint32 i );
extern void pollen_time_TimerManager_Timer_stop__E( pollen_time_TimerManager_Timer_ this );
extern void pollen_time_TimerManager_timerISR__I();
extern void pollen_time_TimerManager_targetInit__I();
extern uint16 pollen_time_TimerManager_Timer_ticksPerSecond__E( pollen_time_TimerManager_Timer_ this );
extern uint32 pollen_time_TimerManager_Timer_getElapsed__E( pollen_time_TimerManager_Timer_ this );


/*
 * ======== data members (unit TimerManager) ========
 */

#define pollen_time_TimerManager_gint__V pollen_time_TimerManager.gint
#define pollen_time_TimerManager_hw_timer__V pollen_time_TimerManager.hw_timer
#define pollen_time_TimerManager_timers__A pollen_time_TimerManager.timers
#define pollen_time_TimerManager_timers_init__A pollen_time_TimerManager.timers->init
#define pollen_time_TimerManager_timers_repeats__A pollen_time_TimerManager.timers->repeats
#define pollen_time_TimerManager_timers_running__A pollen_time_TimerManager.timers->running
#define pollen_time_TimerManager_timers_ticksPerSecond__A pollen_time_TimerManager.timers->ticksPerSecond
#define pollen_time_TimerManager_timers_start__A pollen_time_TimerManager.timers->start
#define pollen_time_TimerManager_timers_stop__A pollen_time_TimerManager.timers->stop
#define pollen_time_TimerManager_timers_setElapsed__A pollen_time_TimerManager.timers->setElapsed
#define pollen_time_TimerManager_timers_getElapsed__A pollen_time_TimerManager.timers->getElapsed
#define pollen_time_TimerManager_timers_id__A pollen_time_TimerManager.timers->id
#define pollen_time_TimerManager_timers_expired__A pollen_time_TimerManager.timers->expired
#define pollen_time_TimerManager_timers_duration__A pollen_time_TimerManager.timers->duration
#define pollen_time_TimerManager_timers_elapsed__A pollen_time_TimerManager.timers->elapsed
#define pollen_time_TimerManager_timers_repeat__A pollen_time_TimerManager.timers->repeat
#define pollen_time_TimerManager_timers_new_host__A pollen_time_TimerManager.timers->new_host
#define pollen_time_TimerManager_timers_new___A pollen_time_TimerManager.timers->new_
