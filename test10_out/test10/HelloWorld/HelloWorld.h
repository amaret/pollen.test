
/*
 * ======== imports ========
 */

#ifndef test10_Event__M
#define test10_Event__M
#include "../../test10/Event/Event.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test10_HelloWorld_pollen__reset__E();
void test10_HelloWorld_pollen__ready__E();
void test10_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test10_HelloWorld_ test10_HelloWorld;

/*
 * ======== struct module definition (unit HelloWorld) ========
 */

struct test10_Event;
struct test10_HelloWorld_ {
    struct test10_Event*  e1;
    struct test10_Event*  e2;
};
typedef struct test10_HelloWorld_ test10_HelloWorld_;

/*
 * ======== function members (unit HelloWorld) ========
 */

extern void test10_HelloWorld_pollen__run__E();
extern bool test10_HelloWorld_start__I( struct test10_Event*  e );
extern void test10_HelloWorld_handle__E( uint8 y );
extern void test10_HelloWorld_targetInit__I();


/*
 * ======== data members (unit HelloWorld) ========
 */

#define test10_HelloWorld_e1__V test10_HelloWorld.e1
#define test10_HelloWorld_e2__V test10_HelloWorld.e2
