
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test5_BlinkMilli_pollen__reset__E();
void test5_BlinkMilli_pollen__ready__E();
void test5_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit AE) ========
 */

typedef void (*pollen_events_AE_EH_handle)(uint8);
struct pollen_events_AE {
    uint8 priority;
    pollen_events_AE_EH_handle handler;
    uint8 data;
};
typedef struct pollen_events_AE pollen_events_AE;
typedef struct pollen_events_AE* pollen_events_AE_;


/*
 * ======== function members (unit AE) ========
 */

extern void pollen_events_AE_AE_setHandler__E( pollen_events_AE_ this, pollen_events_AE_EH_handle handler );
extern void pollen_events_AE_AE_setData__E( pollen_events_AE_ this, uint8 data );
extern uint8 pollen_events_AE_AE_getPriority__E( pollen_events_AE_ this );
extern void pollen_events_AE_AE_handle__E( pollen_events_AE_ this );
extern pollen_events_AE_ pollen_events_AE_AE_new___E( pollen_events_AE_ this, pollen_events_AE_EH_handle handler, uint8 data, uint8 priority );
extern pollen_events_AE_EH_handle pollen_events_AE_AE_getHandler__E( pollen_events_AE_ this );
extern void pollen_events_AE_AE_setPriority__E( pollen_events_AE_ this, uint8 priority );
extern uint8 pollen_events_AE_AE_getData__E( pollen_events_AE_ this );

