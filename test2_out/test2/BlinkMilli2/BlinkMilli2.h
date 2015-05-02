
/*
 * ======== imports ========
 */

#ifndef test2_TT__M
#define test2_TT__M
#include "../../test2/TT/TT.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test2_BlinkMilli2_pollen__ready__E();
void test2_BlinkMilli2_pollen__shutdown__E(uint8 i);

/*
 * ======== enum definitions (unit BlinkMilli2) ========
 */

typedef uint8 test2_BlinkMilli2_State;
#define test2_BlinkMilli2_State_UNINITIALIZED 0
#define test2_BlinkMilli2_State_INITIALIZATION 1
#define test2_BlinkMilli2_State_ACTIVE 2
#define test2_BlinkMilli2_State_IDLE 3
#define test2_BlinkMilli2_State_ERROR 5

/*
 * ======== extern definition ========
 */

extern struct test2_BlinkMilli2_ test2_BlinkMilli2;

/*
 * ======== class definition (unit BlinkMilli2.nestClass) ========
 */

struct test2_BlinkMilli2_nestClass {
};
typedef struct test2_BlinkMilli2_nestClass test2_BlinkMilli2_nestClass;
typedef struct test2_BlinkMilli2_nestClass* test2_BlinkMilli2_nestClass_;

/*
 * ======== struct module definition (unit BlinkMilli2) ========
 */

typedef void (*test2_BlinkMilli2_Led_toggle)();
typedef void (*test2_BlinkMilli2_Led_on)();
struct test2_BlinkMilli2_ {
    uint8 chk;
    test2_BlinkMilli2_Led_toggle gref;
    test2_BlinkMilli2_Led_on fref;
};
typedef struct test2_BlinkMilli2_ test2_BlinkMilli2_;

/*
 * ======== host variables (unit BlinkMilli2) ========
 */

typedef uint8 test2_BlinkMilli2_arr__TYPE;
extern test2_BlinkMilli2_arr__TYPE test2_BlinkMilli2_arr__A[];
typedef uint8 test2_BlinkMilli2_chk2__TYPE;
extern const test2_BlinkMilli2_chk2__TYPE test2_BlinkMilli2_chk2__V;

/*
 * ======== function members (unit BlinkMilli2) ========
 */

extern void test2_BlinkMilli2_bar__E();
extern void test2_BlinkMilli2_pollen__reset__E();
extern void test2_BlinkMilli2_pollen__run__E();
extern uint8 test2_BlinkMilli2_switch_test__E( uint8 state );
extern void test2_BlinkMilli2_foo__E();
extern test2_BlinkMilli2_nestClass_ test2_BlinkMilli2_nestClass_new___E( test2_BlinkMilli2_nestClass_ this );
extern void test2_BlinkMilli2_targetInit__I();


/*
 * ======== data members (unit BlinkMilli2) ========
 */

#define test2_BlinkMilli2_chk__V test2_BlinkMilli2.chk
#define test2_BlinkMilli2_gref__V test2_BlinkMilli2.gref
#define test2_BlinkMilli2_fref__V test2_BlinkMilli2.fref
