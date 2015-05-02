#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test3_PrintTest__M
#define test3_PrintTest__M
#include "../../test3/PrintTest/PrintTest.h"
#endif


/*
 * ======== host data definitions (unit PrintTest) ========
 */

const test3_PrintTest_hv__TYPE test3_PrintTest_hv__V = (uint32)0x0;

/*
 * ======== target data definitions (unit PrintTest) ========
 */

struct test3_PrintTest_ test3_PrintTest = { /* module data */
    (int32)0x0,              /* f1 */
    (int32)0x0,              /* f2 */
    (int32)0x0,              /* f3 */
    "PrintTest",             /* pollen__unitname */
};

/*
 * ======== pollen print ========
 */

void test3_PrintTest_pollen__printBool(bool b) {
}
void test3_PrintTest_pollen__printInt(int32 i) {
}
void test3_PrintTest_pollen__printReal(float f) {
}
void test3_PrintTest_pollen__printUint(uint32 u) {
}
void test3_PrintTest_pollen__printStr(string s) {
}

/*
 * ======== pollen.assert(bool, string) ========
 */

void test3_PrintTest_pollen__assert__E(bool b, string msg) {
    if (!b) {
        test3_PrintTest_pollen__printStr(msg);
        test3_PrintTest_pollen__printStr("\n");
    }
}

/*
 * ======== module functions ========
 */

#include "../../test3/PrintTest/PrintTest.c"

/*
 * ======== pollen.reset() ========
 */

void test3_PrintTest_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test3_PrintTest_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test3_PrintTest_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test3_PrintTest_pollen__reset__E();
    test3_PrintTest_targetInit__I();
    test3_PrintTest_pollen__ready__E();
    test3_PrintTest_pollen__run__E();
    test3_PrintTest_pollen__shutdown__E(0);
}
