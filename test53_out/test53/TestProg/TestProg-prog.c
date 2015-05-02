#include <std.h>


/*
 * ======== protocol member test53.TestProg.m1 delegates test53_Mod1 ========
 */

#ifndef test53_Mod1__M
#define test53_Mod1__M
#include "../../test53/Mod1/Mod1.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test53_Mod1__M
#define test53_Mod1__M
#include "../../test53/Mod1/Mod1.h"
#endif

#ifndef test53_TestProg__M
#define test53_TestProg__M
#include "../../test53/TestProg/TestProg.h"
#endif


/*
 * ======== target data definitions (unit Mod1) ========
 */

struct test53_Mod1_ test53_Mod1 = { /* module data */
};

/*
 * ======== host data definitions (unit TestProg) ========
 */

const test53_TestProg_myFlag__TYPE test53_TestProg_myFlag__V = true;
test53_TestProg_n_host__TYPE test53_TestProg_n_host__V = /* test53.TestProg.Nest object init */
{
    {
        (uint8)0x7,  /* [0] */
        (uint8)0x7,  /* [1] */
        (uint8)0x7,  /* [2] */
        (uint8)0x7,  /* [3] */
        (uint8)0x7,  /* [4] */
        (uint8)0x7,  /* [5] */
        (uint8)0x7,  /* [6] */
        (uint8)0x7,  /* [7] */
        (uint8)0x7,  /* [8] */
        (uint8)0x7,  /* [9] */
        (uint8)0x7,  /* [10] */
        (uint8)0x7,  /* [11] */
    },    /* arr1 */
};
const test53_TestProg_arr1__TYPE test53_TestProg_arr1__A[] = {
    (uint8)0x3,  /* [0] */
    (uint8)0x3,  /* [1] */
    (uint8)0x3,  /* [2] */
    (uint8)0x3,  /* [3] */
    (uint8)0x3,  /* [4] */
    (uint8)0x3,  /* [5] */
    (uint8)0x3,  /* [6] */
    (uint8)0x3,  /* [7] */
    (uint8)0x3,  /* [8] */
    (uint8)0x3,  /* [9] */
    (uint8)0x3,  /* [10] */
    (uint8)0x3,  /* [11] */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test53_TestProg_ test53_TestProg = { /* module data */
    false,                   /* myFlag2 */
    &test53_Mod1,            /* m1 */
    ,                        /* n1 */
    null,                    /* arrChk */
    null,                    /* n */
};

/*
 * ======== pollen print ========
 */

void test53_TestProg_pollen__printBool(bool b) {
}
void test53_TestProg_pollen__printInt(int32 i) {
}
void test53_TestProg_pollen__printReal(float f) {
}
void test53_TestProg_pollen__printUint(uint32 u) {
}
void test53_TestProg_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test53/Mod1/Mod1.c"
#include "../../test53/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test53_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test53_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test53_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test53_TestProg_pollen__reset__E();
    test53_Mod1_targetInit__I();
    test53_TestProg_targetInit__I();
    test53_TestProg_pollen__ready__E();
    test53_TestProg_pollen__run__E();
    test53_TestProg_pollen__shutdown__E(0);
}
