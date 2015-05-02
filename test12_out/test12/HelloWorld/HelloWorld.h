
/*
 * ======== imports ========
 */

#ifndef test12_Event__M
#define test12_Event__M
#include "../../test12/Event/Event.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test12_HelloWorld_pollen__reset__E();
void test12_HelloWorld_pollen__ready__E();
void test12_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test12_HelloWorld_ test12_HelloWorld;

/*
 * ======== struct module definition (unit HelloWorld) ========
 */

struct test12_Event;
struct test12_HelloWorld_ {
    struct test12_Event*  e1;
    struct test12_Event*  e2;
};
typedef struct test12_HelloWorld_ test12_HelloWorld_;

/*
 * ======== function members (unit HelloWorld) ========
 */

extern void test12_HelloWorld_pollen__run__E();
extern bool test12_HelloWorld_start__I( struct test12_Event*  e );
extern void test12_HelloWorld_handle__E( uint8 y );
extern void test12_HelloWorld_targetInit__I();


/*
 * ======== data members (unit HelloWorld) ========
 */

#define test12_HelloWorld_e1__V test12_HelloWorld.e1
#define test12_HelloWorld_e2__V test12_HelloWorld.e2
