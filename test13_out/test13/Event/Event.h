
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test13_HelloWorld_pollen__reset__E();
void test13_HelloWorld_pollen__ready__E();
void test13_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Event) ========
 */

typedef void (*test13_Event_EH_handle)(void*);
struct test13_Event {
    uint8 code;
    test13_Event_EH_handle handler;
};
typedef struct test13_Event test13_Event;
typedef struct test13_Event* test13_Event_;


/*
 * ======== function members (unit Event) ========
 */

extern test13_Event_ test13_Event_Event_get__E( test13_Event_ this, uint8 ii );
extern void test13_Event_Event_handle__E( test13_Event_ this, test13_Event_ e );
extern test13_Event_ test13_Event_Event_new___E( test13_Event_ this, test13_Event_EH_handle handler, uint8 code );


/*
 * ======== const definitions ========
 */

#define test13_Event_X (false)
