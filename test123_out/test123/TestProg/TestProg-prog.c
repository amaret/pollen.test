#include <std.h>


/*
 * ======== protocol member test123.TestProg.pollenPrintProxy delegates test54_PrintImpl ========
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

#ifndef test123_TestProg__M
#define test123_TestProg__M
#include "../../test123/TestProg/TestProg.h"
#endif


/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test123_TestProg_ test123_TestProg = { /* module data */
    {
        (uint8)0x0,  /* [0] */
        (uint8)0x1,  /* [1] */
        (uint8)0x2,  /* [2] */
        (uint8)0x3,  /* [3] */
    },    /* _arr_u8 */
    null,                    /* arr_u8 */
    null,                    /* arr_u16 */
    null,                    /* arr_u32 */
    {
        true,  /* [0] */
    },    /* _arr_b */
    null,                    /* arr_b */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test123_TestProg_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test123_TestProg_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test123_TestProg_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test123_TestProg_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test123_TestProg_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test123/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test123_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test123_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test123_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test123_TestProg_pollen__reset__E();
    test54_PrintImpl_targetInit__I();
    test123_TestProg_targetInit__I();
    test123_TestProg_pollen__ready__E();
    test123_TestProg_pollen__run__E();
    test123_TestProg_pollen__shutdown__E(0);
}
