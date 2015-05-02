
/*
 * ======== imports ========
 */

#ifndef test13_Event__M
#define test13_Event__M
#include "../../test13/Event/Event.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test13_HelloWorld_pollen__reset__E();
void test13_HelloWorld_pollen__ready__E();
void test13_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== enum definitions (unit HelloWorld) ========
 */

typedef uint8 test13_HelloWorld_ClockSource;
#define test13_HelloWorld_ClockSource_SCLK 2
#define test13_HelloWorld_ClockSource_ACLK 7

/*
 * ======== extern definition ========
 */

extern struct test13_HelloWorld_ test13_HelloWorld;

/*
 * ======== struct module definition (unit HelloWorld) ========
 */

struct test13_Event;
struct test13_HelloWorld_ {
    struct test13_Event*  e1;
    struct test13_Event*  e2;
};
typedef struct test13_HelloWorld_ test13_HelloWorld_;

/*
 * ======== function members (unit HelloWorld) ========
 */

extern void test13_HelloWorld_pollen__run__E();
extern bool test13_HelloWorld_start__I( struct test13_Event*  e );
extern void test13_HelloWorld_handle__E( struct test13_Event*  y );
extern void test13_HelloWorld_targetInit__I();


/*
 * ======== data members (unit HelloWorld) ========
 */

#define test13_HelloWorld_e1__V test13_HelloWorld.e1
#define test13_HelloWorld_e2__V test13_HelloWorld.e2
