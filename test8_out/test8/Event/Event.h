
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test8_HelloWorld_pollen__reset__E();
void test8_HelloWorld_pollen__ready__E();
void test8_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Event) ========
 */

typedef void (*test8_Event_EH_handle)(uint8);
struct test8_Event {
    uint8 code;
    test8_Event_EH_handle handler;
    string pollen__unitname;
};
typedef struct test8_Event test8_Event;
typedef struct test8_Event* test8_Event_;


/*
 * ======== function members (unit Event) ========
 */

extern uint8 test8_Event_Event_get__E( test8_Event_ this, uint8 ii );
extern void test8_Event_Event_handle__E( test8_Event_ this, uint8 p );
extern test8_Event_ test8_Event_Event_new___E( test8_Event_ this, test8_Event_EH_handle handler, uint8 code );
extern uint8 test8_Event_Event_getCode__E( test8_Event_ this );

