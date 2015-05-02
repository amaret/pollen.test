#include <std.h>


/*
 * ======== protocol member test82.TestProg.pollenPrintProxy delegates test61_PrintImpl ========
 */

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test82_ArrayReturnErr__M
#define test82_ArrayReturnErr__M
#include "../../test82/ArrayReturnErr/ArrayReturnErr.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif

#ifndef test82_TestProg__M
#define test82_TestProg__M
#include "../../test82/TestProg/TestProg.h"
#endif


/*
 * ======== host data definitions (unit ArrayReturnErr) ========
 */

const test82_ArrayReturnErr_testHost__TYPE test82_ArrayReturnErr_testHost__A[] = {
    (uint8)0x1,  /* [0] */
    (uint8)0x2,  /* [1] */
    (uint8)0x3,  /* [2] */
    (uint8)0x4,  /* [3] */
    (uint8)0x5,  /* [4] */
};

/*
 * ======== target data definitions (unit ArrayReturnErr) ========
 */

struct test82_ArrayReturnErr_ test82_ArrayReturnErr = { /* module data */
    null,                    /* bufNoDim */
    {
        (uint8)0x0,  /* [0] */
        (uint8)0x0,  /* [1] */
        (uint8)0x0,  /* [2] */
    },    /* buffer */
    {
        (uint8)0x1,  /* [0] */
        (uint8)0x2,  /* [1] */
        (uint8)0x3,  /* [2] */
        (uint8)0x4,  /* [3] */
        (uint8)0x5,  /* [4] */
    },    /* test */
    {
        (uint16)0x0,  /* [0] */
        (uint16)0x0,  /* [1] */
        (uint16)0x0,  /* [2] */
        (uint16)0x0,  /* [3] */
        (uint16)0x0,  /* [4] */
    },    /* errbuff */
    null,                    /* errbuff2 */
    null,                    /* bufNoDimHost */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test61_PrintImpl_ test61_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test82_TestProg_ test82_TestProg = { /* module data */
    &test61_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test82_TestProg_pollen__printBool(bool b) {
    test61_PrintImpl_printBool__E(b);
}
void test82_TestProg_pollen__printInt(int32 i) {
    test61_PrintImpl_printInt__E(i);
}
void test82_TestProg_pollen__printReal(float f) {
    test61_PrintImpl_printReal__E(f);
}
void test82_TestProg_pollen__printUint(uint32 u) {
    test61_PrintImpl_printUint__E(u);
}
void test82_TestProg_pollen__printStr(string s) {
    test61_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test82/ArrayReturnErr/ArrayReturnErr.c"
#include "../../test61/PrintImpl/PrintImpl.c"
#include "../../test82/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test82_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test82_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test82_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test82_TestProg_pollen__reset__E();
    test82_ArrayReturnErr_targetInit__I();
    test61_PrintImpl_targetInit__I();
    test82_TestProg_targetInit__I();
    test82_TestProg_pollen__ready__E();
    test82_TestProg_pollen__run__E();
    test82_TestProg_pollen__shutdown__E(0);
}
