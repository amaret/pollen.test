
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test17_TimerManagerTest_pollen__reset__E();
void test17_TimerManagerTest_pollen__ready__E();
void test17_TimerManagerTest_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Event) ========
 */

typedef void (*pollen_events_Event_EH_handle)(uint8);
struct pollen_events_Event {
    uint8 priority;
    pollen_events_Event_EH_handle handler;
    uint8 data;
};
typedef struct pollen_events_Event pollen_events_Event;
typedef struct pollen_events_Event* pollen_events_Event_;


/*
 * ======== function members (unit Event) ========
 */

extern void pollen_events_Event_Event_setHandler__E( pollen_events_Event_ this, pollen_events_Event_EH_handle handler );
extern void pollen_events_Event_Event_setData__E( pollen_events_Event_ this, uint8 data );
extern uint8 pollen_events_Event_Event_getPriority__E( pollen_events_Event_ this );
extern void pollen_events_Event_Event_handle__E( pollen_events_Event_ this );
extern pollen_events_Event_ pollen_events_Event_Event_new___E( pollen_events_Event_ this, pollen_events_Event_EH_handle handler, uint8 data, uint8 priority );
extern pollen_events_Event_EH_handle pollen_events_Event_Event_getHandler__E( pollen_events_Event_ this );
extern void pollen_events_Event_Event_setPriority__E( pollen_events_Event_ this, uint8 priority );
extern uint8 pollen_events_Event_Event_getData__E( pollen_events_Event_ this );

