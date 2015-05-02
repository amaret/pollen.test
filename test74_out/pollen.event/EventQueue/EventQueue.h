
/*
 * ======== imports ========
 */

#ifndef pollen_event_Event__M
#define pollen_event_Event__M
#include "../../pollen.event/Event/Event.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test74_Test_20_pollen__reset__E();
void test74_Test_20_pollen__ready__E();
void test74_Test_20_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit EventQueue) ========
 */

struct pollen_event_Event;
struct pollen_event_EventQueue {
    uint8 capacity;
    struct pollen_event_Event*  elements[1] /* capacity */;
    uint8 length;
    uint8 head;
    uint8 tail;
};
typedef struct pollen_event_EventQueue pollen_event_EventQueue;
typedef struct pollen_event_EventQueue* pollen_event_EventQueue_;


/*
 * ======== host variables (unit EventQueue) ========
 */

typedef uint8 pollen_event_EventQueue_capacity__TYPE;
extern pollen_event_EventQueue_capacity__TYPE pollen_event_EventQueue_capacity__V;

/*
 * ======== function members (unit EventQueue) ========
 */

extern bool pollen_event_EventQueue_EventQueue_add__E( pollen_event_EventQueue_ this, struct pollen_event_Event*  e );
extern bool pollen_event_EventQueue_EventQueue_isEmpty__E( pollen_event_EventQueue_ this );
extern uint8 pollen_event_EventQueue_EventQueue_getLength__E( pollen_event_EventQueue_ this );
extern pollen_event_EventQueue_ pollen_event_EventQueue_EventQueue_new___E( pollen_event_EventQueue_ this );
extern struct pollen_event_Event*  pollen_event_EventQueue_EventQueue_remove__E( pollen_event_EventQueue_ this );
extern struct pollen_event_Event*  pollen_event_EventQueue_EventQueue_peek__E( pollen_event_EventQueue_ this );
extern uint8 pollen_event_EventQueue_EventQueue_getCapacity__E( pollen_event_EventQueue_ this );

