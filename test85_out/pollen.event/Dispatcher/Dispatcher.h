
/*
 * ======== imports ========
 */

#ifndef pollen_event_EventQueue__M
#define pollen_event_EventQueue__M
#include "../../pollen.event/EventQueue/EventQueue.h"
#endif

#ifndef pollen_event_Event__M
#define pollen_event_Event__M
#include "../../pollen.event/Event/Event.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test85_Test_11_pollen__reset__E();
void test85_Test_11_pollen__ready__E();
void test85_Test_11_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_event_Dispatcher_ pollen_event_Dispatcher;

/*
 * ======== struct module definition (unit Dispatcher) ========
 */

struct pollen_event_EventQueue;
struct virtual_mcu_GlobalInterrupts_;
struct pollen_event_Dispatcher_ {
    struct virtual_mcu_GlobalInterrupts_ *GI;
};
typedef struct pollen_event_Dispatcher_ pollen_event_Dispatcher_;

/*
 * ======== host variables (unit Dispatcher) ========
 */

typedef uint8 pollen_event_Dispatcher_capacity__TYPE;
extern const pollen_event_Dispatcher_capacity__TYPE pollen_event_Dispatcher_capacity__V;
typedef struct pollen_event_EventQueue pollen_event_Dispatcher_events__TYPE;
extern pollen_event_Dispatcher_events__TYPE pollen_event_Dispatcher_events__V;

/*
 * ======== function members (unit Dispatcher) ========
 */

struct pollen_event_Event;
extern void pollen_event_Dispatcher_postFromInterrupt__E( struct pollen_event_Event*  e );
extern void pollen_event_Dispatcher_dispatch__I();
extern void pollen_event_Dispatcher_post__E( struct pollen_event_Event*  e );
extern void pollen_event_Dispatcher_run__E();
extern void pollen_event_Dispatcher_targetInit__I();


/*
 * ======== data members (unit Dispatcher) ========
 */

#define pollen_event_Dispatcher_events__V pollen_event_Dispatcher_events
#define pollen_event_Dispatcher_GI__V pollen_event_Dispatcher.GI
