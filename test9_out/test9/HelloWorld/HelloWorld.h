
/*
 * ======== imports ========
 */

#ifndef test9_Event__M
#define test9_Event__M
#include "../../test9/Event/Event.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test9_HelloWorld_pollen__reset__E();
void test9_HelloWorld_pollen__ready__E();
void test9_HelloWorld_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test9_HelloWorld_ test9_HelloWorld;

/*
 * ======== struct module definition (unit HelloWorld) ========
 */

struct test9_Event;
struct test9_HelloWorld_ {
    struct test9_Event*  e1;
    struct test9_Event*  e2;
};
typedef struct test9_HelloWorld_ test9_HelloWorld_;

/*
 * ======== function members (unit HelloWorld) ========
 */

extern void test9_HelloWorld_pollen__run__E();
extern bool test9_HelloWorld_start__I( struct test9_Event*  e );
struct test9_Y_;
extern void test9_HelloWorld_handle__E( struct test9_Y_*  id );
extern void test9_HelloWorld_targetInit__I();


/*
 * ======== data members (unit HelloWorld) ========
 */

#define test9_HelloWorld_e1__V test9_HelloWorld.e1
#define test9_HelloWorld_e2__V test9_HelloWorld.e2
