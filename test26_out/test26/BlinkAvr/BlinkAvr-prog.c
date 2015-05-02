#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test26_BlinkAvr__M
#define test26_BlinkAvr__M
#include "../../test26/BlinkAvr/BlinkAvr.h"
#endif


/*
 * ======== target data definitions (unit BlinkAvr) ========
 */

struct test26_BlinkAvr_ test26_BlinkAvr = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test26_BlinkAvr_pollen__printBool(bool b) {
}
void test26_BlinkAvr_pollen__printInt(int32 i) {
}
void test26_BlinkAvr_pollen__printReal(float f) {
}
void test26_BlinkAvr_pollen__printUint(uint32 u) {
}
void test26_BlinkAvr_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test26/BlinkAvr/BlinkAvr.c"

/*
 * ======== pollen.reset() ========
 */

void test26_BlinkAvr_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test26_BlinkAvr_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test26_BlinkAvr_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test26_BlinkAvr_pollen__reset__E();
    test26_BlinkAvr_targetInit__I();
    test26_BlinkAvr_pollen__ready__E();
    test26_BlinkAvr_pollen__run__E();
    test26_BlinkAvr_pollen__shutdown__E(0);
}
