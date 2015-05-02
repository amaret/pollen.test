
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test47_DispatcherTest_pollen__reset__E();
void test47_DispatcherTest_pollen__ready__E();
void test47_DispatcherTest_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Ev) ========
 */

typedef void (*test47_Ev_EH_handle)(uint8);
struct test47_Ev {
    uint8 priority;
    test47_Ev_EH_handle handler;
    uint8 data;
};
typedef struct test47_Ev test47_Ev;
typedef struct test47_Ev* test47_Ev_;


/*
 * ======== function members (unit Ev) ========
 */

extern void test47_Ev_Ev_setHandler__E( test47_Ev_ this, test47_Ev_EH_handle handler );
extern void test47_Ev_Ev_setData__E( test47_Ev_ this, uint8 data );
extern uint8 test47_Ev_Ev_getPriority__E( test47_Ev_ this );
extern void test47_Ev_Ev_handle__E( test47_Ev_ this, uint8 data );
extern test47_Ev_EH_handle test47_Ev_Ev_getHandler__E( test47_Ev_ this );
extern test47_Ev_ test47_Ev_Ev_new___E( test47_Ev_ this );
extern void test47_Ev_Ev_setPriority__E( test47_Ev_ this, uint8 priority );
extern uint8 test47_Ev_Ev_getData__E( test47_Ev_ this );

