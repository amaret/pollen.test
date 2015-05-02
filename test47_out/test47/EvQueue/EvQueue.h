
/*
 * ======== imports ========
 */

#ifndef test47_Ev__M
#define test47_Ev__M
#include "../../test47/Ev/Ev.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test47_DispatcherTest_pollen__reset__E();
void test47_DispatcherTest_pollen__ready__E();
void test47_DispatcherTest_pollen__shutdown__E(uint8 i);

/*
 * ======== class definition (unit EvQueue) ========
 */

struct test47_Ev;
struct test47_EvQueue {
    const uint8 capacity;
    struct test47_Ev  elements[10] /* capacity */;
    uint8 length;
    uint8 head;
    uint8 tail;
    uint8 maxLength;
};
typedef struct test47_EvQueue test47_EvQueue;
typedef struct test47_EvQueue* test47_EvQueue_;


/*
 * ======== host variables (unit EvQueue) ========
 */

typedef test47_Ev test47_EvQueue_elements__TYPE;
extern test47_EvQueue_elements__TYPE test47_EvQueue_elements__A[];

/*
 * ======== function members (unit EvQueue) ========
 */

extern bool test47_EvQueue_EvQueue_add__E( test47_EvQueue_ this, struct test47_Ev*  e );
extern bool test47_EvQueue_EvQueue_isEmpty__E( test47_EvQueue_ this );
extern uint8 test47_EvQueue_EvQueue_getLength__E( test47_EvQueue_ this );
extern test47_EvQueue_ test47_EvQueue_EvQueue_new___I( test47_EvQueue_ this );
extern struct test47_Ev*  test47_EvQueue_EvQueue_remove__E( test47_EvQueue_ this );
extern struct test47_Ev*  test47_EvQueue_EvQueue_peek__E( test47_EvQueue_ this );
extern uint8 test47_EvQueue_EvQueue_getCapacity__E( test47_EvQueue_ this );


/*
 * ======== const definitions ========
 */

#define test47_EvQueue_capacity (10)
