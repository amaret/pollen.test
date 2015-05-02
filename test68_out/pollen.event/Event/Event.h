
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test68_Test_11_pollen__reset__E();
void test68_Test_11_pollen__ready__E();
void test68_Test_11_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Event) ========
 */

typedef void (*pollen_event_Event_EP_handler)();
struct pollen_event_Event {
;
    pollen_event_Event_EP_handler eventHandler;
};
typedef struct pollen_event_Event pollen_event_Event;
typedef struct pollen_event_Event* pollen_event_Event_;


/*
 * ======== function members (unit Event) ========
 */

extern void pollen_event_Event_Event_setHandler__E( pollen_event_Event_ this, pollen_event_Event_EP_handler h );
extern void pollen_event_Event_Event_fire__E( pollen_event_Event_ this );
extern pollen_event_Event_ pollen_event_Event_Event_new___E( pollen_event_Event_ this, pollen_event_Event_EP_handler h );

