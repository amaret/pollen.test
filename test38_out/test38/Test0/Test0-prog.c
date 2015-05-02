#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test38_Test0__M
#define test38_Test0__M
#include "../../test38/Test0/Test0.h"
#endif


/*
 * ======== target data definitions (unit Test0) ========
 */

struct test38_Test0_ test38_Test0 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test38_Test0_pollen__printBool(bool b) {
}
void test38_Test0_pollen__printInt(int32 i) {
}
void test38_Test0_pollen__printReal(float f) {
}
void test38_Test0_pollen__printUint(uint32 u) {
}
void test38_Test0_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test38/Test0/Test0.c"

/*
 * ======== pollen.reset() ========
 */

void test38_Test0_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test38_Test0_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test38_Test0_pollen__reset__E();
    test38_Test0_targetInit__I();
    test38_Test0_pollen__ready__E();
    test38_Test0_pollen__run__E();
    test38_Test0_pollen__shutdown__E(0);
}
