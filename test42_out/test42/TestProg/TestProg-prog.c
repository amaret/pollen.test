#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test42_TestMod__M
#define test42_TestMod__M
#include "../../test42/TestMod/TestMod.h"
#endif

#ifndef test42_TestProg__M
#define test42_TestProg__M
#include "../../test42/TestProg/TestProg.h"
#endif


/*
 * ======== target data definitions (unit TestMod) ========
 */

struct test42_TestMod_ test42_TestMod = { /* module data */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test42_TestProg_ test42_TestProg = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test42_TestProg_pollen__printBool(bool b) {
}
void test42_TestProg_pollen__printInt(int32 i) {
}
void test42_TestProg_pollen__printReal(float f) {
}
void test42_TestProg_pollen__printUint(uint32 u) {
}
void test42_TestProg_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test42/TestMod/TestMod.c"
#include "../../test42/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test42_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test42_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test42_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test42_TestProg_pollen__reset__E();
    test42_TestMod_targetInit__I();
    test42_TestProg_targetInit__I();
    test42_TestProg_pollen__ready__E();
    test42_TestProg_pollen__run__E();
    test42_TestProg_pollen__shutdown__E(0);
}
