#include <std.h>


/*
 * ======== protocol member test55.TestProg.pollenPrintProxy delegates test55_PrintImpl ========
 */

#ifndef test55_PrintImpl__M
#define test55_PrintImpl__M
#include "../../test55/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test55_PrintImpl__M
#define test55_PrintImpl__M
#include "../../test55/PrintImpl/PrintImpl.h"
#endif

#ifndef test55_TestProg__M
#define test55_TestProg__M
#include "../../test55/TestProg/TestProg.h"
#endif


/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test55_PrintImpl_ test55_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit TestProg) ========
 */

const test55_TestProg_arr1__TYPE test55_TestProg_arr1__A[] = {
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
test55_TestProg_n_host__TYPE test55_TestProg_n_host__V = /* test55.TestProg.Nest object init */
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
    },    /* nest_arr1 */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test55_TestProg_ test55_TestProg = { /* module data */
    null,                    /* n1 */
    null,                    /* n */
    (const uint8)0x1,    /* ALIGN_8BIT */
    (const uint8)0x2,    /* ALIGN_16BIT */
    (const uint8)0x4,    /* ALIGN_32BIT */
    &test55_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test55_TestProg_pollen__printBool(bool b) {
    test55_PrintImpl_printBool__E(b);
}
void test55_TestProg_pollen__printInt(int32 i) {
    test55_PrintImpl_printInt__E(i);
}
void test55_TestProg_pollen__printReal(float f) {
    test55_PrintImpl_printReal__E(f);
}
void test55_TestProg_pollen__printUint(uint32 u) {
    test55_PrintImpl_printUint__E(u);
}
void test55_TestProg_pollen__printStr(string s) {
    test55_PrintImpl_printStr__E(s);
}

/*
 * ======== pollen.assert(bool, string) ========
 */

void test55_TestProg_pollen__assert__E(bool b, string msg) {
    if (!b) {
        test55_TestProg_pollen__printStr(msg);
        test55_TestProg_pollen__printStr("\n");
    }
}

/*
 * ======== module functions ========
 */

#include "../../test55/PrintImpl/PrintImpl.c"
#include "../../test55/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test55_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test55_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test55_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test55_TestProg_pollen__reset__E();
    test55_PrintImpl_targetInit__I();
    test55_TestProg_targetInit__I();
    test55_TestProg_pollen__ready__E();
    test55_TestProg_pollen__run__E();
    test55_TestProg_pollen__shutdown__E(0);
}
