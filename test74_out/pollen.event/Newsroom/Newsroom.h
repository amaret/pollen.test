
/*
 * ======== imports ========
 */

#ifndef pollen_event_Event__M
#define pollen_event_Event__M
#include "../../pollen.event/Event/Event.h"
#endif

#ifndef pollen_event_EventQueue__M
#define pollen_event_EventQueue__M
#include "../../pollen.event/EventQueue/EventQueue.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test74_Test_20_pollen__reset__E();
void test74_Test_20_pollen__ready__E();
void test74_Test_20_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct pollen_event_Newsroom_ pollen_event_Newsroom;

/*
 * ======== struct module definition (unit Newsroom) ========
 */

struct pollen_event_EventQueue;
struct virtual_mcu_GlobalInterrupts_;
struct pollen_event_Newsroom_ {
    struct virtual_mcu_GlobalInterrupts_ *GI;
};
typedef struct pollen_event_Newsroom_ pollen_event_Newsroom_;

/*
 * ======== host variables (unit Newsroom) ========
 */

typedef struct pollen_event_EventQueue pollen_event_Newsroom_events__TYPE;
extern pollen_event_Newsroom_events__TYPE pollen_event_Newsroom_events__V;

/*
 * ======== function members (unit Newsroom) ========
 */

struct pollen_event_Event;
extern void pollen_event_Newsroom_postFromInterrupt__E( struct pollen_event_Event*  event );
extern void pollen_event_Newsroom_dispatch__I();
extern void pollen_event_Newsroom_post__E( struct pollen_event_Event*  event );
extern void pollen_event_Newsroom_run__E();
extern void pollen_event_Newsroom_targetInit__I();


/*
 * ======== data members (unit Newsroom) ========
 */

#define pollen_event_Newsroom_events__V pollen_event_Newsroom_events
#define pollen_event_Newsroom_GI__V pollen_event_Newsroom.GI
