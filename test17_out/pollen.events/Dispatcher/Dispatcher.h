
/*
 * ======== imports ========
 */

#ifndef pollen_events_AE__M
#define pollen_events_AE__M
#include "../../pollen.events/AE/AE.h"
#endif

#ifndef pollen_data_AEQueue__M
#define pollen_data_AEQueue__M
#include "../../pollen.data/AEQueue/AEQueue.h"
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

extern struct pollen_events_Dispatcher_ pollen_events_Dispatcher;

/*
 * ======== struct module definition (unit Dispatcher) ========
 */

struct pollen_events_Dispatcher_ {
};
typedef struct pollen_events_Dispatcher_ pollen_events_Dispatcher_;

/*
 * ======== function members (unit Dispatcher) ========
 */

struct pollen_events_AE;
extern void pollen_events_Dispatcher_postFromInterrupt__E( struct pollen_events_AE*  e );
extern void pollen_events_Dispatcher_post__E( struct pollen_events_AE*  e );
extern void pollen_events_Dispatcher_run__E();
extern void pollen_events_Dispatcher_targetInit__I();


/*
 * ======== data members (unit Dispatcher) ========
 */

