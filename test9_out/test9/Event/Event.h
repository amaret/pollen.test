
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test9_HelloWorld_pollen__reset__E();
void test9_HelloWorld_pollen__ready__E();
void test9_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Event) ========
 */

typedef void (*test9_Event_EH_handle)(uint8);
struct test9_Event {
    uint8 code;
    test9_Event_EH_handle handler;
    test9_Event_EH_handle handler2;
};
typedef struct test9_Event test9_Event;
typedef struct test9_Event* test9_Event_;


/*
 * ======== function members (unit Event) ========
 */

extern uint8 test9_Event_Event_get__E( test9_Event_ this, uint8 ii );
extern void test9_Event_Event_handle__E( test9_Event_ this );
extern test9_Event_ test9_Event_Event_new___E( test9_Event_ this, test9_Event_EH_handle handler, uint8 code );

