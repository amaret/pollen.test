
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test12_HelloWorld_pollen__reset__E();
void test12_HelloWorld_pollen__ready__E();
void test12_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Event) ========
 */

typedef void (*test12_Event_EH_handle)(void);
struct test12_Event {
    uint8 code;
    test12_Event_EH_handle handler;
};
typedef struct test12_Event test12_Event;
typedef struct test12_Event* test12_Event_;


/*
 * ======== function members (unit Event) ========
 */

extern uint8 test12_Event_Event_get__E( test12_Event_ this, uint8 ii );
extern void test12_Event_Event_handle__E( test12_Event_ this );
extern test12_Event_ test12_Event_Event_new___E( test12_Event_ this, test12_Event_EH_handle handler, uint8 code );

