#include <std.h>


/*
 * ======== protocol member test99.Test.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test99_Test__M
#define test99_Test__M
#include "../../test99/Test/Test.h"
#endif


/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit Test) ========
 */

test99_Test_arrClsHost__TYPE test99_Test_arrClsHost__A[] = {
    /* test99.Test.Cls object init */
    {
        (uint8)0x1,              /* i */
    },  /* [0] */
    /* test99.Test.Cls object init */
    {
        (uint8)0x1,              /* i */
    },  /* [1] */
    /* test99.Test.Cls object init */
    {
        (uint8)0x1,              /* i */
    },  /* [2] */
};

/*
 * ======== target data definitions (unit Test) ========
 */

struct test99_Test_ test99_Test = { /* module data */
    null,                    /* cls */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test99_Test_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test99_Test_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test99_Test_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test99_Test_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test99_Test_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test99/Test/Test.c"

/*
 * ======== pollen.reset() ========
 */

void test99_Test_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test99_Test_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test99_Test_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test99_Test_pollen__reset__E();
    test54_PrintImpl_targetInit__I();
    test99_Test_targetInit__I();
    test99_Test_pollen__ready__E();
    test99_Test_pollen__run__E();
    test99_Test_pollen__shutdown__E(0);
}
