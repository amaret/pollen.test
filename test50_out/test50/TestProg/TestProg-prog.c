#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test50_Class1__M
#define test50_Class1__M
#include "../../test50/Class1/Class1.h"
#endif

#ifndef test50_TestProg__M
#define test50_TestProg__M
#include "../../test50/TestProg/TestProg.h"
#endif


/*
 * ======== host data definitions (unit TestProg) ========
 */

test50_TestProg_hll__TYPE test50_TestProg_hll__V = /* test50.TestProg.led object init */
{
    (uint8)0x1,              /* red */
    (uint8)0x0,              /* green */
    (uint8)0x7,              /* blue */
};
test50_TestProg_leds__TYPE test50_TestProg_leds__A[] = {
    /* test50.TestProg.led object init */
    {
        (uint8)0x1,              /* red */
        (uint8)0x0,              /* green */
        (uint8)0x7,              /* blue */
    },  /* [0] */
    /* test50.TestProg.led object init */
    {
        (uint8)0x1,              /* red */
        (uint8)0x0,              /* green */
        (uint8)0x7,              /* blue */
    },  /* [1] */
};
const test50_TestProg_nums__TYPE test50_TestProg_nums__A[] = {
    (uint8)0x1,  /* [0] */
    (uint8)0x2,  /* [1] */
};
test50_TestProg_c_host__TYPE test50_TestProg_c_host__V = /* test50.Class1 object init */
{
    (uint8)0x3,              /* z */
    (uint8)0x7,              /* x */
};
test50_TestProg_j__TYPE test50_TestProg_j__V = /* test50.TestProg.led object init */
{
    (uint8)0x1,              /* red */
    (uint8)0x0,              /* green */
    (uint8)0x7,              /* blue */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test50_TestProg_ test50_TestProg = { /* module data */
    (uint8)0x0,              /* xx */
};

/*
 * ======== pollen print ========
 */

void test50_TestProg_pollen__printBool(bool b) {
}
void test50_TestProg_pollen__printInt(int32 i) {
}
void test50_TestProg_pollen__printReal(float f) {
}
void test50_TestProg_pollen__printUint(uint32 u) {
}
void test50_TestProg_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test50/Class1/Class1.c"
#include "../../test50/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test50_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test50_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test50_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test50_TestProg_pollen__reset__E();
    test50_TestProg_targetInit__I();
    test50_TestProg_pollen__ready__E();
    test50_TestProg_pollen__run__E();
    test50_TestProg_pollen__shutdown__E(0);
}
