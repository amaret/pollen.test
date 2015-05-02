
/*
 * ======== imports ========
 */

#ifndef virtual_mcu_ConsolePrint__M
#define virtual_mcu_ConsolePrint__M
#include "../../virtual.mcu/ConsolePrint/ConsolePrint.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test69_Test_12_pollen__reset__E();
void test69_Test_12_pollen__ready__E();
void test69_Test_12_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_event_Events_ pollen_event_Events;

/*
 * ======== class definition (unit Events.Event) ========
 */

typedef void (*pollen_event_Events_HP_handler)();
struct pollen_event_Events_Event {
    pollen_event_Events_HP_handler handler;
};
typedef struct pollen_event_Events_Event pollen_event_Events_Event;
typedef struct pollen_event_Events_Event* pollen_event_Events_Event_;

/*
 * ======== struct module definition (unit Events) ========
 */

struct pollen_event_Events_ {
    uint8 numEvents;
};
typedef struct pollen_event_Events_ pollen_event_Events_;

/*
 * ======== function members (unit Events) ========
 */

extern void pollen_event_Events_Event_setHandler__E( pollen_event_Events_Event_ this, pollen_event_Events_HP_handler h );
extern void pollen_event_Events_test__E( pollen_event_Events_Event_ e );
extern pollen_event_Events_Event_ pollen_event_Events_Event_new___E( pollen_event_Events_Event_ this, pollen_event_Events_HP_handler h );
extern void pollen_event_Events_targetInit__I();


/*
 * ======== data members (unit Events) ========
 */

#define pollen_event_Events_numEvents__V pollen_event_Events.numEvents
