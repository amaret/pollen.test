
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test11_HelloWorld_pollen__reset__E();
void test11_HelloWorld_pollen__ready__E();
void test11_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Event) ========
 */

typedef void (*test11_Event_EH_handle)(void);
struct test11_Event {
    uint8 code;
    test11_Event_EH_handle handler;
};
typedef struct test11_Event test11_Event;
typedef struct test11_Event* test11_Event_;


/*
 * ======== function members (unit Event) ========
 */

extern uint8 test11_Event_Event_get__E( test11_Event_ this, uint8 ii );
extern void test11_Event_Event_handle__E( test11_Event_ this );
extern test11_Event_ test11_Event_Event_new___E( test11_Event_ this, test11_Event_EH_handle handler, uint8 code );

