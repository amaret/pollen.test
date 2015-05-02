
/*
 * ======== imports ========
 */

#ifndef test47_Dispatcher__M
#define test47_Dispatcher__M
#include "../../test47/Dispatcher/Dispatcher.h"
#endif

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
 * ======== extern definition ========
 */

extern struct test47_DispatcherTest_ test47_DispatcherTest;

/*
 * ======== struct module definition (unit DispatcherTest) ========
 */

struct test47_Ev;
struct test47_DispatcherTest_ {
};
typedef struct test47_DispatcherTest_ test47_DispatcherTest_;

/*
 * ======== host variables (unit DispatcherTest) ========
 */

typedef struct test47_Ev test47_DispatcherTest_e1__TYPE;
extern test47_DispatcherTest_e1__TYPE test47_DispatcherTest_e1__V;
typedef struct test47_Ev test47_DispatcherTest_e2__TYPE;
extern test47_DispatcherTest_e2__TYPE test47_DispatcherTest_e2__V;
typedef struct test47_Ev test47_DispatcherTest_e3__TYPE;
extern test47_DispatcherTest_e3__TYPE test47_DispatcherTest_e3__V;

/*
 * ======== function members (unit DispatcherTest) ========
 */

extern void test47_DispatcherTest_pollen__run__E();
extern void test47_DispatcherTest_handle__E( uint8 data );
extern void test47_DispatcherTest_targetInit__I();


/*
 * ======== data members (unit DispatcherTest) ========
 */

#define test47_DispatcherTest_e1__V test47_DispatcherTest_e1
#define test47_DispatcherTest_e2__V test47_DispatcherTest_e2
#define test47_DispatcherTest_e3__V test47_DispatcherTest_e3
