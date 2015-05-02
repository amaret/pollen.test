#include <std.h>


/*
 * ======== protocol member test117.TestProg.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test117_ArrayReturn__M
#define test117_ArrayReturn__M
#include "../../test117/ArrayReturn/ArrayReturn.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test117_TestProg__M
#define test117_TestProg__M
#include "../../test117/TestProg/TestProg.h"
#endif


/*
 * ======== host data definitions (unit ArrayReturn) ========
 */

test117_ArrayReturn_arrCls1Inst__TYPE test117_ArrayReturn_arrCls1Inst__A[] = {
    /* test117.ArrayReturn.Cls1 object init */
    {
        (uint8)0x63,             /* cVar */
    },  /* [0] */
};

/*
 * ======== target data definitions (unit ArrayReturn) ========
 */

struct test117_ArrayReturn_ test117_ArrayReturn = { /* module data */
    {
        null,  /* [0] */
    },    /* arrCls1Ref */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test117_TestProg_ test117_TestProg = { /* module data */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test117_TestProg_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test117_TestProg_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test117_TestProg_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test117_TestProg_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test117_TestProg_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test117/ArrayReturn/ArrayReturn.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test117/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test117_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test117_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test117_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test117_TestProg_pollen__reset__E();
    test117_ArrayReturn_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test117_TestProg_targetInit__I();
    test117_TestProg_pollen__ready__E();
    test117_TestProg_pollen__run__E();
    test117_TestProg_pollen__shutdown__E(0);
}
