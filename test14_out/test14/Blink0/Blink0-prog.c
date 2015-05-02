#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test14_Blink0__M
#define test14_Blink0__M
#include "../../test14/Blink0/Blink0.h"
#endif


/*
 * ======== target data definitions (unit Blink0) ========
 */

struct test14_Blink0_ test14_Blink0 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test14_Blink0_pollen__printBool(bool b) {
}
void test14_Blink0_pollen__printInt(int32 i) {
}
void test14_Blink0_pollen__printReal(float f) {
}
void test14_Blink0_pollen__printUint(uint32 u) {
}
void test14_Blink0_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test14/Blink0/Blink0.c"

/*
 * ======== pollen.reset() ========
 */

void test14_Blink0_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test14_Blink0_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test14_Blink0_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test14_Blink0_pollen__reset__E();
    test14_Blink0_targetInit__I();
    test14_Blink0_pollen__ready__E();
    test14_Blink0_pollen__run__E();
    test14_Blink0_pollen__shutdown__E(0);
}
