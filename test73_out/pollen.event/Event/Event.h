
/*
 * ======== imports ========
 */

#ifndef pollen_event_Newsroom__M
#define pollen_event_Newsroom__M
#include "../../pollen.event/Newsroom/Newsroom.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test73_Test_16_pollen__reset__E();
void test73_Test_16_pollen__ready__E();
void test73_Test_16_pollen__shutdown__E(uint8 i);

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
extern pollen_event_Event_HP_handler pollen_event_Event_Event_getHandler__E( pollen_event_Event_ this );

