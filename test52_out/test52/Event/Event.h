
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test52_HelloWorld_pollen__reset__E();
void test52_HelloWorld_pollen__ready__E();
void test52_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Event) ========
 */

typedef void (*test52_Event_EH_handle)(uint8);
struct test52_Event {
    uint8 code;
    test52_Event_EH_handle handler;
};
typedef struct test52_Event test52_Event;
typedef struct test52_Event* test52_Event_;


/*
 * ======== function members (unit Event) ========
 */

extern uint8 test52_Event_Event_get__E( test52_Event_ this, uint8 ii );
extern void test52_Event_Event_handle__E( test52_Event_ this );
extern test52_Event_ test52_Event_Event_new___E( test52_Event_ this, test52_Event_EH_handle handler, uint8 code );

