#include <std.h>


/*
 * ======== protocol member test54.TestProg.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test54_Junk__M
#define test54_Junk__M
#include "../../test54/Junk/Junk.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test54_TestProg__M
#define test54_TestProg__M
#include "../../test54/TestProg/TestProg.h"
#endif


/*
 * ======== target data definitions (unit Junk) ========
 */

struct test54_Junk_ test54_Junk = { /* module data */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit TestProg) ========
 */

test54_TestProg_aNest__TYPE test54_TestProg_aNest__V = /* test54.TestProg.Nest object init */
{
    true,                    /* flag */
    (uint32)0x4d,            /* aNum */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test54_TestProg_ test54_TestProg = { /* module data */
    "Test this string",    /* s1 */
    (uint8)0x1,              /* u8 */
    (uint16)0x2,             /* u16 */
    (uint32)0x3,             /* u32 */
    (int8)0x4,               /* i8 */
    (int16)0x5,              /* i16 */
    (int32)0x6,              /* i32 */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test54_TestProg_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test54_TestProg_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test54_TestProg_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test54_TestProg_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test54_TestProg_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test54/Junk/Junk.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test54/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test54_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test54_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test54_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test54_TestProg_pollen__reset__E();
    test54_Junk_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test54_TestProg_targetInit__I();
    test54_TestProg_pollen__ready__E();
    test54_TestProg_pollen__run__E();
    test54_TestProg_pollen__shutdown__E(0);
}
