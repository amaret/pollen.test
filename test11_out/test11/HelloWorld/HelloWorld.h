
/*
 * ======== imports ========
 */

#ifndef test11_Event__M
#define test11_Event__M
#include "../../test11/Event/Event.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test11_HelloWorld_pollen__reset__E();
void test11_HelloWorld_pollen__ready__E();
void test11_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test11_HelloWorld_ test11_HelloWorld;

/*
 * ======== struct module definition (unit HelloWorld) ========
 */

struct test11_Event;
struct test11_HelloWorld_ {
    struct test11_Event*  e1;
    struct test11_Event*  e2;
};
typedef struct test11_HelloWorld_ test11_HelloWorld_;

/*
 * ======== function members (unit HelloWorld) ========
 */

extern void test11_HelloWorld_pollen__run__E();
extern bool test11_HelloWorld_start__I( struct test11_Event*  e );
extern void test11_HelloWorld_handle__E( uint8 y );
extern void test11_HelloWorld_targetInit__I();


/*
 * ======== data members (unit HelloWorld) ========
 */

#define test11_HelloWorld_e1__V test11_HelloWorld.e1
#define test11_HelloWorld_e2__V test11_HelloWorld.e2
