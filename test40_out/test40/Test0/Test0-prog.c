#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test40_M__M
#define test40_M__M
#include "../../test40/M/M.h"
#endif

#ifndef test40_Test0__M
#define test40_Test0__M
#include "../../test40/Test0/Test0.h"
#endif


/*
 * ======== target data definitions (unit M) ========
 */

struct test40_M_ test40_M = { /* module data */
    (uint8)0x0,              /* t */
};

/*
 * ======== target data definitions (unit Test0) ========
 */

struct test40_Test0_ test40_Test0 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test40_Test0_pollen__printBool(bool b) {
}
void test40_Test0_pollen__printInt(int32 i) {
}
void test40_Test0_pollen__printReal(float f) {
}
void test40_Test0_pollen__printUint(uint32 u) {
}
void test40_Test0_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test40/M/M.c"
#include "../../test40/Test0/Test0.c"

/*
 * ======== pollen.reset() ========
 */

void test40_Test0_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test40_Test0_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test40_Test0_pollen__reset__E();
    test40_M_targetInit__I();
    test40_Test0_targetInit__I();
    test40_Test0_pollen__ready__E();
    test40_Test0_pollen__run__E();
    test40_Test0_pollen__shutdown__E(0);
}
