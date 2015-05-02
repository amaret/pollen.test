#include <std.h>


/*
 * ======== protocol member test75.Test.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test75_Cls1__M
#define test75_Cls1__M
#include "../../test75/Cls1/Cls1.h"
#endif

#ifndef test75_TestFcnRtn__M
#define test75_TestFcnRtn__M
#include "../../test75/TestFcnRtn/TestFcnRtn.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test75_Test__M
#define test75_Test__M
#include "../../test75/Test/Test.h"
#endif


/*
 * ======== host data definitions (unit TestFcnRtn) ========
 */

test75_TestFcnRtn_c1__TYPE test75_TestFcnRtn_c1__V = /* test75.Cls1 object init */
{
    (uint8)0x7,              /* fld */
};

/*
 * ======== target data definitions (unit TestFcnRtn) ========
 */

struct test75_TestFcnRtn_ test75_TestFcnRtn = { /* module data */
    null,                    /* c2 */
    (uint8)0x0,              /* r1 */
    true,                    /* r2 */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit Test) ========
 */

struct test75_Test_ test75_Test = { /* module data */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test75_Test_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test75_Test_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test75_Test_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test75_Test_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test75_Test_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test75/Cls1/Cls1.c"
#include "../../test75/TestFcnRtn/TestFcnRtn.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test75/Test/Test.c"

/*
 * ======== pollen.reset() ========
 */

void test75_Test_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test75_Test_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test75_Test_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test75_Test_pollen__reset__E();
    test75_TestFcnRtn_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test75_Test_targetInit__I();
    test75_Test_pollen__ready__E();
    test75_Test_pollen__run__E();
    test75_Test_pollen__shutdown__E(0);
}
