
/*
 * ======== imports ========
 */

#ifndef pollen_event_Dispatcher__M
#define pollen_event_Dispatcher__M
#include "../../pollen.event/Dispatcher/Dispatcher.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test72_Test_13_pollen__reset__E();
void test72_Test_13_pollen__ready__E();
void test72_Test_13_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Event) ========
 */

typedef void (*pollen_event_Event_HP_handler)();
struct pollen_event_Event {
    pollen_event_Event_HP_handler eventHandler;
};
typedef struct pollen_event_Event pollen_event_Event;
typedef struct pollen_event_Event* pollen_event_Event_;


/*
 * ======== function members (unit Event) ========
 */

extern void pollen_event_Event_Event_setHandler__E( pollen_event_Event_ this, pollen_event_Event_HP_handler h );
extern void pollen_event_Event_Event_postFromInterrupt__E( pollen_event_Event_ this );
extern void pollen_event_Event_Event_post__E( pollen_event_Event_ this );
extern void pollen_event_Event_Event_fire__E( pollen_event_Event_ this );
extern pollen_event_Event_ pollen_event_Event_Event_new___E( pollen_event_Event_ this, pollen_event_Event_HP_handler h );

