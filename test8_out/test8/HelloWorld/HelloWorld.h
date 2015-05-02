
/*
 * ======== imports ========
 */

#ifndef test8_Event__M
#define test8_Event__M
#include "../../test8/Event/Event.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test8_HelloWorld_pollen__reset__E();
void test8_HelloWorld_pollen__ready__E();
void test8_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test8_HelloWorld_ test8_HelloWorld;

/*
 * ======== struct module definition (unit HelloWorld) ========
 */

struct test8_Event;
struct test8_HelloWorld_ {
    struct test8_Event*  e1;
    struct test8_Event*  e2;
};
typedef struct test8_HelloWorld_ test8_HelloWorld_;

/*
 * ======== function members (unit HelloWorld) ========
 */

extern void test8_HelloWorld_pollen__run__E();
extern bool test8_HelloWorld_start__I( struct test8_Event*  e );
extern void test8_HelloWorld_handle__E( uint8 z );
extern void test8_HelloWorld_targetInit__I();


/*
 * ======== data members (unit HelloWorld) ========
 */

#define test8_HelloWorld_e1__V test8_HelloWorld.e1
#define test8_HelloWorld_e2__V test8_HelloWorld.e2
