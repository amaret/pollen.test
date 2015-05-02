
/*
 * ======== imports ========
 */


/*
 * ======== forward declarations for intrinsics ========
 */

void test49_Client_pollen__reset__E();
void test49_Client_pollen__ready__E();
void test49_Client_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit Event) ========
 */

typedef void (*test49_Event_EH_handle)(uint8);
struct test49_Event {
    uint8 code;
    test49_Event_EH_handle handler;
};
typedef struct test49_Event test49_Event;
typedef struct test49_Event* test49_Event_;


/*
 * ======== function members (unit Event) ========
 */

extern void test49_Event_Event_handle__E( test49_Event_ this );
extern test49_Event_ test49_Event_Event_new___E( test49_Event_ this );

