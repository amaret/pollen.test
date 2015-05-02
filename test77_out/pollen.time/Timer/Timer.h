
/*
 * ======== imports ========
 */

#ifndef pollen_event_Event__M
#define pollen_event_Event__M
#include "../../pollen.event/Event/Event.h"
#endif

#ifndef pollen_time_TimerManager__M
#define pollen_time_TimerManager__M
#include "../../pollen.time/TimerManager/TimerManager.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test77_Test_21_pollen__reset__E();
void test77_Test_21_pollen__ready__E();
void test77_Test_21_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Timer) ========
 */

typedef void (*pollen_time_Timer_HP_handler)();
struct pollen_event_Event;
struct pollen_time_Timer {
    struct pollen_event_Event  tickEvent;
    bool active;
    bool periodic;
    uint16 duration;
    uint16 tickCount;
};
typedef struct pollen_time_Timer pollen_time_Timer;
typedef struct pollen_time_Timer* pollen_time_Timer_;


/*
 * ======== host variables (unit Timer) ========
 */

typedef struct pollen_event_Event pollen_time_Timer_tickEvent__TYPE;
extern pollen_time_Timer_tickEvent__TYPE pollen_time_Timer_tickEvent__V;

/*
 * ======== function members (unit Timer) ========
 */

extern void pollen_time_Timer_Timer_stop__E( pollen_time_Timer_ this );
extern void pollen_time_Timer_Timer_start__E( pollen_time_Timer_ this, uint16 ms, bool repeat );
extern void pollen_time_Timer_Timer_fire__E( pollen_time_Timer_ this );
extern void pollen_time_Timer_Timer_tick__E( pollen_time_Timer_ this );
extern bool pollen_time_Timer_Timer_isActive__E( pollen_time_Timer_ this );
extern pollen_time_Timer_ pollen_time_Timer_Timer_new___E( pollen_time_Timer_ this );

