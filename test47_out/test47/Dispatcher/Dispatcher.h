
/*
 * ======== imports ========
 */

#ifndef test47_Ev__M
#define test47_Ev__M
#include "../../test47/Ev/Ev.h"
#endif

#ifndef test47_EvQueue__M
#define test47_EvQueue__M
#include "../../test47/EvQueue/EvQueue.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test47_DispatcherTest_pollen__reset__E();
void test47_DispatcherTest_pollen__ready__E();
void test47_DispatcherTest_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test47_Dispatcher_ test47_Dispatcher;

/*
 * ======== struct module definition (unit Dispatcher) ========
 */

struct test47_EvQueue;
struct test47_Dispatcher_ {
};
typedef struct test47_Dispatcher_ test47_Dispatcher_;

/*
 * ======== host variables (unit Dispatcher) ========
 */

typedef struct test47_EvQueue test47_Dispatcher_myEventQueue__TYPE;
extern test47_Dispatcher_myEventQueue__TYPE test47_Dispatcher_myEventQueue__V;

/*
 * ======== function members (unit Dispatcher) ========
 */

struct test47_Ev;
extern void test47_Dispatcher_post__E( struct test47_Ev*  e );
extern void test47_Dispatcher_run__E();
extern void test47_Dispatcher_targetInit__I();


/*
 * ======== data members (unit Dispatcher) ========
 */

#define test47_Dispatcher_myEventQueue__V test47_Dispatcher_myEventQueue
