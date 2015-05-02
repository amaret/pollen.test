#include <std.h>


/*
 * ======== protocol member test79.TestProg.pollenPrintProxy delegates test79_PrintImpl ========
 */

#ifndef test79_PrintImpl__M
#define test79_PrintImpl__M
#include "../../test79/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test79_Junk__M
#define test79_Junk__M
#include "../../test79/Junk/Junk.h"
#endif

#ifndef test79_PrintImpl__M
#define test79_PrintImpl__M
#include "../../test79/PrintImpl/PrintImpl.h"
#endif

#ifndef test79_TestProg__M
#define test79_TestProg__M
#include "../../test79/TestProg/TestProg.h"
#endif


/*
 * ======== target data definitions (unit Junk) ========
 */

struct test79_Junk_ test79_Junk = { /* module data */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test79_PrintImpl_ test79_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit TestProg) ========
 */

test79_TestProg_aNest__TYPE test79_TestProg_aNest__V = /* test79.TestProg.Nest object init */
{
    true,                    /* flag */
    (uint32)0x4d,            /* aNum */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test79_TestProg_ test79_TestProg = { /* module data */
    "Test this string",    /* s1 */
    (uint8)0x1,              /* u8 */
    (uint16)0x2,             /* u16 */
    (uint32)0x3,             /* u32 */
    (int8)0x4,               /* i8 */
    (int16)0x5,              /* i16 */
    (int32)0x6,              /* i32 */
    &test79_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test79_TestProg_pollen__printBool(bool b) {
    test79_PrintImpl_printBool__E(b);
}
void test79_TestProg_pollen__printInt(int32 i) {
    test79_PrintImpl_printInt__E(i);
}
void test79_TestProg_pollen__printReal(float f) {
    test79_PrintImpl_printReal__E(f);
}
void test79_TestProg_pollen__printUint(uint32 u) {
    test79_PrintImpl_printUint__E(u);
}
void test79_TestProg_pollen__printStr(string s) {
    test79_PrintImpl_printStr__E(s);
}

/*
 * ======== pollen.assert(bool, string) ========
 */

void test79_TestProg_pollen__assert__E(bool b, string msg) {
    if (!b) {
        test79_TestProg_pollen__printStr(msg);
        test79_TestProg_pollen__printStr("\n");
    }
}

/*
 * ======== module functions ========
 */

#include "../../test79/Junk/Junk.c"
#include "../../test79/PrintImpl/PrintImpl.c"
#include "../../test79/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test79_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test79_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test79_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test79_TestProg_pollen__reset__E();
    test79_Junk_targetInit__I();
    test79_PrintImpl_targetInit__I();
    test79_TestProg_targetInit__I();
    test79_TestProg_pollen__ready__E();
    test79_TestProg_pollen__run__E();
    test79_TestProg_pollen__shutdown__E(0);
}
