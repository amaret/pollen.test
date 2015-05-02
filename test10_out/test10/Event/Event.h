
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test10_HelloWorld_pollen__reset__E();
void test10_HelloWorld_pollen__ready__E();
void test10_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Event) ========
 */

typedef void (*test10_Event_EH_handle)(uint8);
struct test10_Event {
    uint8 code;
    test10_Event_EH_handle handler;
};
typedef struct test10_Event test10_Event;
typedef struct test10_Event* test10_Event_;


/*
 * ======== function members (unit Event) ========
 */

extern uint8 test10_Event_Event_get__E( test10_Event_ this, uint8 ii );
extern void test10_Event_Event_handle__E( test10_Event_ this );
extern test10_Event_ test10_Event_Event_new___E( test10_Event_ this, test10_Event_EH_handle handler, uint8 code );

