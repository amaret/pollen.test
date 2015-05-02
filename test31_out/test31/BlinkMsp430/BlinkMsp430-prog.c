#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test31_BlinkMsp430__M
#define test31_BlinkMsp430__M
#include "../../test31/BlinkMsp430/BlinkMsp430.h"
#endif


/*
 * ======== target data definitions (unit BlinkMsp430) ========
 */

struct test31_BlinkMsp430_ test31_BlinkMsp430 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test31_BlinkMsp430_pollen__printBool(bool b) {
}
void test31_BlinkMsp430_pollen__printInt(int32 i) {
}
void test31_BlinkMsp430_pollen__printReal(float f) {
}
void test31_BlinkMsp430_pollen__printUint(uint32 u) {
}
void test31_BlinkMsp430_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test31/BlinkMsp430/BlinkMsp430.c"

/*
 * ======== pollen.reset() ========
 */

void test31_BlinkMsp430_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test31_BlinkMsp430_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test31_BlinkMsp430_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test31_BlinkMsp430_pollen__reset__E();
    test31_BlinkMsp430_targetInit__I();
    test31_BlinkMsp430_pollen__ready__E();
    test31_BlinkMsp430_pollen__run__E();
    test31_BlinkMsp430_pollen__shutdown__E(0);
}
