#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test34_TestMod__M
#define test34_TestMod__M
#include "../../test34/TestMod/TestMod.h"
#endif

#ifndef test34_TestProg__M
#define test34_TestProg__M
#include "../../test34/TestProg/TestProg.h"
#endif


/*
 * ======== target data definitions (unit TestMod) ========
 */

struct test34_TestMod_ test34_TestMod = { /* module data */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test34_TestProg_ test34_TestProg = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test34_TestProg_pollen__printBool(bool b) {
}
void test34_TestProg_pollen__printInt(int32 i) {
}
void test34_TestProg_pollen__printReal(float f) {
}
void test34_TestProg_pollen__printUint(uint32 u) {
}
void test34_TestProg_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test34/TestMod/TestMod.c"
#include "../../test34/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test34_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test34_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test34_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test34_TestProg_pollen__reset__E();
    test34_TestMod_targetInit__I();
    test34_TestProg_targetInit__I();
    test34_TestProg_pollen__ready__E();
    test34_TestProg_pollen__run__E();
    test34_TestProg_pollen__shutdown__E(0);
}
