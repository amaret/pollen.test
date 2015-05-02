
/*
 * ======== imports ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test118_BlinkMilli_pollen__reset__E();
void test118_BlinkMilli_pollen__ready__E();
void test118_BlinkMilli_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test118_BlinkMilli_ test118_BlinkMilli;

/*
 * ======== class definition (unit BlinkMilli.led) ========
 */

struct test118_BlinkMilli_led {
    uint8 red;
    uint8 blue;
};
typedef struct test118_BlinkMilli_led test118_BlinkMilli_led;
typedef struct test118_BlinkMilli_led* test118_BlinkMilli_led_;

/*
 * ======== struct module definition (unit BlinkMilli) ========
 */

struct test54_PrintImpl_;
struct test118_BlinkMilli_ {
    uint8 nonhostarr[4];
    test118_BlinkMilli_led_ leds[3];
    uint8 chkarr[4];
    uint8 * chkarr2;
    uint8 chkarr3[3];
    uint8 chkarr4[2];
    uint8 nonhostVarTest;
    uint8 chkarr6[9] /* nonhostVarTest */;
    uint8 chkarr8[9] /* hostVarTest2 */;
    struct test54_PrintImpl_ *pollenPrintProxy;
};
typedef struct test118_BlinkMilli_ test118_BlinkMilli_;

/*
 * ======== host variables (unit BlinkMilli) ========
 */

typedef struct test118_BlinkMilli_led test118_BlinkMilli_hll__TYPE;
extern test118_BlinkMilli_hll__TYPE test118_BlinkMilli_hll__V;
typedef test118_BlinkMilli_led test118_BlinkMilli_ledArr__TYPE;
extern test118_BlinkMilli_ledArr__TYPE test118_BlinkMilli_ledArr__A[];
typedef uint8 test118_BlinkMilli_hostarr__TYPE;
extern const test118_BlinkMilli_hostarr__TYPE test118_BlinkMilli_hostarr__A[];
typedef uint8 test118_BlinkMilli_chkarr5__TYPE;
extern const test118_BlinkMilli_chkarr5__TYPE test118_BlinkMilli_chkarr5__A[];
typedef uint8 test118_BlinkMilli_hostVarTest2__TYPE;
extern const test118_BlinkMilli_hostVarTest2__TYPE test118_BlinkMilli_hostVarTest2__V;
typedef uint8 test118_BlinkMilli_chkarr7__TYPE;
extern const test118_BlinkMilli_chkarr7__TYPE test118_BlinkMilli_chkarr7__A[];
typedef uint8 test118_BlinkMilli_initialBlue__TYPE;
extern const test118_BlinkMilli_initialBlue__TYPE test118_BlinkMilli_initialBlue__V;

/*
 * ======== function members (unit BlinkMilli) ========
 */

extern void test118_BlinkMilli_foobar__I( uint8  p[] );
extern uint8 test118_BlinkMilli_led_test_led__I( test118_BlinkMilli_led_ this );
extern uint8 test118_BlinkMilli_test__I( bool f );
extern void test118_BlinkMilli_pollen__run__E();
extern uint8 test118_BlinkMilli_led_foo__E( test118_BlinkMilli_led_ this, uint8 p );
extern test118_BlinkMilli_led_ test118_BlinkMilli_led_new___I( test118_BlinkMilli_led_ this );
extern void test118_BlinkMilli_targetInit__E();
extern bool test118_BlinkMilli_chkArray__I( uint8 y );


/*
 * ======== data members (unit BlinkMilli) ========
 */

#define test118_BlinkMilli_hll__V test118_BlinkMilli_hll
#define test118_BlinkMilli_hll_red__V test118_BlinkMilli_hll.red
#define test118_BlinkMilli_hll_blue__V test118_BlinkMilli_hll.blue
#define test118_BlinkMilli_hll_test_led__V test118_BlinkMilli_hll.test_led
#define test118_BlinkMilli_hll_new_host__V test118_BlinkMilli_hll.new_host
#define test118_BlinkMilli_hll_new___V test118_BlinkMilli_hll.new_
#define test118_BlinkMilli_hll_foo__V test118_BlinkMilli_hll.foo
#define test118_BlinkMilli_nonhostarr__A test118_BlinkMilli.nonhostarr
#define test118_BlinkMilli_leds__A test118_BlinkMilli.leds
#define test118_BlinkMilli_leds_red__A test118_BlinkMilli.leds->red
#define test118_BlinkMilli_leds_blue__A test118_BlinkMilli.leds->blue
#define test118_BlinkMilli_leds_test_led__A test118_BlinkMilli.leds->test_led
#define test118_BlinkMilli_leds_new_host__A test118_BlinkMilli.leds->new_host
#define test118_BlinkMilli_leds_new___A test118_BlinkMilli.leds->new_
#define test118_BlinkMilli_leds_foo__A test118_BlinkMilli.leds->foo
#define test118_BlinkMilli_chkarr__A test118_BlinkMilli.chkarr
#define test118_BlinkMilli_chkarr2__V test118_BlinkMilli.chkarr2
#define test118_BlinkMilli_chkarr3__A test118_BlinkMilli.chkarr3
#define test118_BlinkMilli_chkarr4__A test118_BlinkMilli.chkarr4
#define test118_BlinkMilli_nonhostVarTest__V test118_BlinkMilli.nonhostVarTest
#define test118_BlinkMilli_chkarr6__A test118_BlinkMilli.chkarr6
#define test118_BlinkMilli_chkarr8__A test118_BlinkMilli.chkarr8
#define test118_BlinkMilli_pollenPrintProxy__V test118_BlinkMilli.pollenPrintProxy
