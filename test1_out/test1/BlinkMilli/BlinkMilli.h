
/*
 * ======== imports ========
 */

#ifndef test1_GlobalInterrupts__M
#define test1_GlobalInterrupts__M
#include "../../test1/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef test1_Cls1__M
#define test1_Cls1__M
#include "../../test1/Cls1/Cls1.h"
#endif

#ifndef test1_SwitchTest__M
#define test1_SwitchTest__M
#include "../../test1/SwitchTest/SwitchTest.h"
#endif

#ifndef test1_Cls2__M
#define test1_Cls2__M
#include "../../test1/Cls2/Cls2.h"
#endif

#ifndef test1_Cls3__M
#define test1_Cls3__M
#include "../../test1/Cls3/Cls3.h"
#endif

#ifndef test1_ModFix__M
#define test1_ModFix__M
#include "../../test1/ModFix/ModFix.h"
#endif

#ifndef test1_MoreArrays__M
#define test1_MoreArrays__M
#include "../../test1/MoreArrays/MoreArrays.h"
#endif

#ifndef test1_ArrayAssign__M
#define test1_ArrayAssign__M
#include "../../test1/ArrayAssign/ArrayAssign.h"
#endif

#ifndef test1_ShortClassAccessInModule__M
#define test1_ShortClassAccessInModule__M
#include "../../test1/ShortClassAccessInModule/ShortClassAccessInModule.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test1_BlinkMilli_pollen__reset__E();
void test1_BlinkMilli_pollen__ready__E();
void test1_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test1_BlinkMilli_ test1_BlinkMilli;

/*
 * ======== class definition (unit BlinkMilli.led) ========
 */

struct test1_BlinkMilli_led {
    uint8 red;
    uint8 green;
    uint8 blue;
};
typedef struct test1_BlinkMilli_led test1_BlinkMilli_led;
typedef struct test1_BlinkMilli_led* test1_BlinkMilli_led_;

/*
 * ======== struct module definition (unit BlinkMilli) ========
 */

struct test1_Cls3;
struct test1_Cls2;
struct test1_GlobalInterrupts_;
struct test1_Cls1;
struct test1_BlinkMilli_ {
    test1_BlinkMilli_led_ tll;
    test1_BlinkMilli_led_ leds[3];
    uint8 nonhostarr[4];
    uint8 chkarr[4];
    uint8 * chkarr2;
    uint8 chkarr3[3];
    uint8 chkarr4[2];
    struct test1_GlobalInterrupts_ *gi;
    uint8 nonhostVarTest;
    uint8 chkarr6[9] /* nonhostVarTest */;
    uint8 chkarr8[9] /* hostVarTest2 */;
    uint8 hostVarRefdInTarget;
    string thing;
};
typedef struct test1_BlinkMilli_ test1_BlinkMilli_;

/*
 * ======== host variables (unit BlinkMilli) ========
 */

typedef uint8 test1_BlinkMilli_myVar__TYPE;
extern const test1_BlinkMilli_myVar__TYPE test1_BlinkMilli_myVar__V;
typedef uint8 test1_BlinkMilli_myVarArr__TYPE;
extern const test1_BlinkMilli_myVarArr__TYPE test1_BlinkMilli_myVarArr__A[];
typedef struct test1_BlinkMilli_led test1_BlinkMilli_hll__TYPE;
extern test1_BlinkMilli_hll__TYPE test1_BlinkMilli_hll__V;
typedef struct test1_Cls3 test1_BlinkMilli_testNest__TYPE;
extern test1_BlinkMilli_testNest__TYPE test1_BlinkMilli_testNest__V;
typedef struct test1_Cls2 test1_BlinkMilli_testcls2__TYPE;
extern test1_BlinkMilli_testcls2__TYPE test1_BlinkMilli_testcls2__V;
typedef test1_BlinkMilli_led test1_BlinkMilli_ledArr__TYPE;
extern test1_BlinkMilli_ledArr__TYPE test1_BlinkMilli_ledArr__A[];
typedef uint8 test1_BlinkMilli_hostarr__TYPE;
extern const test1_BlinkMilli_hostarr__TYPE test1_BlinkMilli_hostarr__A[];
typedef uint8 test1_BlinkMilli_hostarr2d__TYPE;
extern const test1_BlinkMilli_hostarr2d__TYPE test1_BlinkMilli_hostarr2d__A[][];
typedef uint8 test1_BlinkMilli_chkarr5__TYPE;
extern const test1_BlinkMilli_chkarr5__TYPE test1_BlinkMilli_chkarr5__A[];
typedef uint8 test1_BlinkMilli_hostVarTest2__TYPE;
extern const test1_BlinkMilli_hostVarTest2__TYPE test1_BlinkMilli_hostVarTest2__V;
typedef uint8 test1_BlinkMilli_chkarr7__TYPE;
extern const test1_BlinkMilli_chkarr7__TYPE test1_BlinkMilli_chkarr7__A[];
typedef uint8 test1_BlinkMilli_hostVarNotRefdInTarget__TYPE;
extern const test1_BlinkMilli_hostVarNotRefdInTarget__TYPE test1_BlinkMilli_hostVarNotRefdInTarget__V;
typedef uint8 test1_BlinkMilli_initialBlue__TYPE;
extern const test1_BlinkMilli_initialBlue__TYPE test1_BlinkMilli_initialBlue__V;
typedef struct test1_Cls1 test1_BlinkMilli_ccc__TYPE;
extern test1_BlinkMilli_ccc__TYPE test1_BlinkMilli_ccc__V;

/*
 * ======== function members (unit BlinkMilli) ========
 */

extern uint8 test1_BlinkMilli_test__I( bool f );
extern uint8 test1_BlinkMilli_led_foo__E( test1_BlinkMilli_led_ this, uint8 p );
extern test1_BlinkMilli_led_ test1_BlinkMilli_led_new___I( test1_BlinkMilli_led_ this );
extern void test1_BlinkMilli_put__I( uint8 i );
extern void test1_BlinkMilli_test_str__I( string x );
extern bool test1_BlinkMilli_chkArray__I( uint8 y );
extern void test1_BlinkMilli_foobar__I( uint8  p[] );
extern uint8 test1_BlinkMilli_led_test_led__I( test1_BlinkMilli_led_ this );
extern void test1_BlinkMilli_pollen__run__E();
extern void test1_BlinkMilli_markUsed__I();
extern void test1_BlinkMilli_targetInit__E();


/*
 * ======== data members (unit BlinkMilli) ========
 */

#define test1_BlinkMilli_hll__V test1_BlinkMilli_hll
#define test1_BlinkMilli_hll_red__V test1_BlinkMilli_hll.red
#define test1_BlinkMilli_hll_green__V test1_BlinkMilli_hll.green
#define test1_BlinkMilli_hll_blue__V test1_BlinkMilli_hll.blue
#define test1_BlinkMilli_hll_test_led__V test1_BlinkMilli_hll.test_led
#define test1_BlinkMilli_hll_new_host__V test1_BlinkMilli_hll.new_host
#define test1_BlinkMilli_hll_new___V test1_BlinkMilli_hll.new_
#define test1_BlinkMilli_hll_foo__V test1_BlinkMilli_hll.foo
#define test1_BlinkMilli_tll__V test1_BlinkMilli.tll
#define test1_BlinkMilli_tll_red__V test1_BlinkMilli.tll->red
#define test1_BlinkMilli_tll_green__V test1_BlinkMilli.tll->green
#define test1_BlinkMilli_tll_blue__V test1_BlinkMilli.tll->blue
#define test1_BlinkMilli_tll_test_led__V test1_BlinkMilli.tll->test_led
#define test1_BlinkMilli_tll_new_host__V test1_BlinkMilli.tll->new_host
#define test1_BlinkMilli_tll_new___V test1_BlinkMilli.tll->new_
#define test1_BlinkMilli_tll_foo__V test1_BlinkMilli.tll->foo
#define test1_BlinkMilli_testNest__V test1_BlinkMilli_testNest
#define test1_BlinkMilli_testcls2__V test1_BlinkMilli_testcls2
#define test1_BlinkMilli_leds__A test1_BlinkMilli.leds
#define test1_BlinkMilli_leds_red__A test1_BlinkMilli.leds->red
#define test1_BlinkMilli_leds_green__A test1_BlinkMilli.leds->green
#define test1_BlinkMilli_leds_blue__A test1_BlinkMilli.leds->blue
#define test1_BlinkMilli_leds_test_led__A test1_BlinkMilli.leds->test_led
#define test1_BlinkMilli_leds_new_host__A test1_BlinkMilli.leds->new_host
#define test1_BlinkMilli_leds_new___A test1_BlinkMilli.leds->new_
#define test1_BlinkMilli_leds_foo__A test1_BlinkMilli.leds->foo
#define test1_BlinkMilli_nonhostarr__A test1_BlinkMilli.nonhostarr
#define test1_BlinkMilli_chkarr__A test1_BlinkMilli.chkarr
#define test1_BlinkMilli_chkarr2__V test1_BlinkMilli.chkarr2
#define test1_BlinkMilli_chkarr3__A test1_BlinkMilli.chkarr3
#define test1_BlinkMilli_chkarr4__A test1_BlinkMilli.chkarr4
#define test1_BlinkMilli_gi__V test1_BlinkMilli.gi
#define test1_BlinkMilli_nonhostVarTest__V test1_BlinkMilli.nonhostVarTest
#define test1_BlinkMilli_chkarr6__A test1_BlinkMilli.chkarr6
#define test1_BlinkMilli_chkarr8__A test1_BlinkMilli.chkarr8
#define test1_BlinkMilli_hostVarRefdInTarget__V test1_BlinkMilli.hostVarRefdInTarget
#define test1_BlinkMilli_thing__V test1_BlinkMilli.thing
#define test1_BlinkMilli_ccc__V test1_BlinkMilli_ccc
