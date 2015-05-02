#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test15_Msp430g2231__M
#define test15_Msp430g2231__M
#include "../../test15/Msp430g2231/Msp430g2231.h"
#endif


/*
 * ======== host data definitions (unit Msp430g2231) ========
 */

const test15_Msp430g2231_mclkFrequency__TYPE test15_Msp430g2231_mclkFrequency__V = (uint32)0xf4240;
const test15_Msp430g2231_smclkFrequency__TYPE test15_Msp430g2231_smclkFrequency__V = (uint32)0xf4240;
const test15_Msp430g2231_aclkFrequency__TYPE test15_Msp430g2231_aclkFrequency__V = (uint32)0x0;

/*
 * ======== target data definitions (unit Msp430g2231) ========
 */

struct test15_Msp430g2231_ test15_Msp430g2231 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test15_Msp430g2231_pollen__printBool(bool b) {
}
void test15_Msp430g2231_pollen__printInt(int32 i) {
}
void test15_Msp430g2231_pollen__printReal(float f) {
}
void test15_Msp430g2231_pollen__printUint(uint32 u) {
}
void test15_Msp430g2231_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test15/Msp430g2231/Msp430g2231.c"

/*
 * ======== pollen.reset() ========
 */

void test15_Msp430g2231_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test15_Msp430g2231_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test15_Msp430g2231_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test15_Msp430g2231_pollen__reset__E();
    test15_Msp430g2231_targetInit__I();
    test15_Msp430g2231_pollen__ready__E();
    test15_Msp430g2231_pollen__run__E();
    test15_Msp430g2231_pollen__shutdown__E(0);
}
