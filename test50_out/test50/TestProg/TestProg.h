
/*
 * ======== imports ========
 */

#ifndef test50_Class1__M
#define test50_Class1__M
#include "../../test50/Class1/Class1.h"
#endif


/*
 * ======== forward declarations for intrinsics ========
 */

void test50_TestProg_pollen__reset__E();
void test50_TestProg_pollen__ready__E();
void test50_TestProg_pollen__shutdown__E(uint8 i);

/*
 * ======== extern definition ========
 */

extern struct test50_TestProg_ test50_TestProg;

/*
 * ======== class definition (unit TestProg.led) ========
 */

struct test50_TestProg_led {
    uint8 red;
    uint8 green;
    uint8 blue;
};
typedef struct test50_TestProg_led test50_TestProg_led;
typedef struct test50_TestProg_led* test50_TestProg_led_;

/*
 * ======== struct module definition (unit TestProg) ========
 */

struct test50_Class1;
struct test50_TestProg_ {
    uint8 xx;
};
typedef struct test50_TestProg_ test50_TestProg_;

/*
 * ======== host variables (unit TestProg) ========
 */

typedef struct test50_TestProg_led test50_TestProg_hll__TYPE;
extern test50_TestProg_hll__TYPE test50_TestProg_hll__V;
typedef test50_TestProg_led test50_TestProg_leds__TYPE;
extern test50_TestProg_leds__TYPE test50_TestProg_leds__A[];
typedef uint8 test50_TestProg_nums__TYPE;
extern const test50_TestProg_nums__TYPE test50_TestProg_nums__A[];
typedef struct test50_Class1 test50_TestProg_c_host__TYPE;
extern test50_TestProg_c_host__TYPE test50_TestProg_c_host__V;
typedef struct test50_TestProg_led test50_TestProg_j__TYPE;
extern test50_TestProg_j__TYPE test50_TestProg_j__V;

/*
 * ======== function members (unit TestProg) ========
 */

extern void test50_TestProg_led_print_led__I( test50_TestProg_led_ this, string name );
extern uint8 test50_TestProg_led_test_led__I( test50_TestProg_led_ this );
extern void test50_TestProg_test__E();
extern void test50_TestProg_pollen__run__E();
extern test50_TestProg_led_ test50_TestProg_led_new___I( test50_TestProg_led_ this );
extern void test50_TestProg_targetInit__I();


/*
 * ======== data members (unit TestProg) ========
 */

#define test50_TestProg_xx__V test50_TestProg.xx
#define test50_TestProg_hll__V test50_TestProg_hll
#define test50_TestProg_hll_red__V test50_TestProg_hll.red
#define test50_TestProg_hll_green__V test50_TestProg_hll.green
#define test50_TestProg_hll_blue__V test50_TestProg_hll.blue
#define test50_TestProg_hll_test_led__V test50_TestProg_hll.test_led
#define test50_TestProg_hll_new_host__V test50_TestProg_hll.new_host
#define test50_TestProg_hll_new___V test50_TestProg_hll.new_
#define test50_TestProg_hll_print_led__V test50_TestProg_hll.print_led
#define test50_TestProg_hll_fcnTest__V test50_TestProg_hll.fcnTest
#define test50_TestProg_hll_fcnTest1__V test50_TestProg_hll.fcnTest1
#define test50_TestProg_c_host__V test50_TestProg_c_host
#define test50_TestProg_j__V test50_TestProg_j
#define test50_TestProg_j_red__V test50_TestProg_j.red
#define test50_TestProg_j_green__V test50_TestProg_j.green
#define test50_TestProg_j_blue__V test50_TestProg_j.blue
#define test50_TestProg_j_test_led__V test50_TestProg_j.test_led
#define test50_TestProg_j_new_host__V test50_TestProg_j.new_host
#define test50_TestProg_j_new___V test50_TestProg_j.new_
#define test50_TestProg_j_print_led__V test50_TestProg_j.print_led
#define test50_TestProg_j_fcnTest__V test50_TestProg_j.fcnTest
#define test50_TestProg_j_fcnTest1__V test50_TestProg_j.fcnTest1
