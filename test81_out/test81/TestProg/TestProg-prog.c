#include <std.h>


/*
 * ======== protocol member test81.TestProg.pollenPrintProxy delegates test61_PrintImpl ========
 */

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test81_ArrayReturn__M
#define test81_ArrayReturn__M
#include "../../test81/ArrayReturn/ArrayReturn.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif

#ifndef test81_TestProg__M
#define test81_TestProg__M
#include "../../test81/TestProg/TestProg.h"
#endif


/*
 * ======== target data definitions (unit ArrayReturn) ========
 */

struct test81_ArrayReturn_ test81_ArrayReturn = { /* module data */
    null,                    /* bufNoDim */
    {
        (uint8)0x0,  /* [0] */
        (uint8)0x0,  /* [1] */
        (uint8)0x0,  /* [2] */
        (uint8)0x0,  /* [3] */
        (uint8)0x0,  /* [4] */
    },    /* buffer */
    {
        (uint8)0x1,  /* [0] */
        (uint8)0x2,  /* [1] */
        (uint8)0x3,  /* [2] */
        (uint8)0x4,  /* [3] */
        (uint8)0x5,  /* [4] */
    },    /* test1 */
    {
        true,  /* [0] */
        false,  /* [1] */
        false,  /* [2] */
        true,  /* [3] */
        false,  /* [4] */
    },    /* test2 */
    {
        (bool)0x0,  /* [0] */
        (bool)0x0,  /* [1] */
        (bool)0x0,  /* [2] */
        (bool)0x0,  /* [3] */
        (bool)0x0,  /* [4] */
    },    /* buffer2 */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test61_PrintImpl_ test61_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test81_TestProg_ test81_TestProg = { /* module data */
    &test61_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test81_TestProg_pollen__printBool(bool b) {
    test61_PrintImpl_printBool__E(b);
}
void test81_TestProg_pollen__printInt(int32 i) {
    test61_PrintImpl_printInt__E(i);
}
void test81_TestProg_pollen__printReal(float f) {
    test61_PrintImpl_printReal__E(f);
}
void test81_TestProg_pollen__printUint(uint32 u) {
    test61_PrintImpl_printUint__E(u);
}
void test81_TestProg_pollen__printStr(string s) {
    test61_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test81/ArrayReturn/ArrayReturn.c"
#include "../../test61/PrintImpl/PrintImpl.c"
#include "../../test81/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test81_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test81_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test81_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test81_TestProg_pollen__reset__E();
    test81_ArrayReturn_targetInit__I();
    test61_PrintImpl_targetInit__I();
    test81_TestProg_targetInit__I();
    test81_TestProg_pollen__ready__E();
    test81_TestProg_pollen__run__E();
    test81_TestProg_pollen__shutdown__E(0);
}
