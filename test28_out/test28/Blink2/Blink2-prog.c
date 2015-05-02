#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test28_MspPin__M
#define test28_MspPin__M
#include "../../test28/MspPin/MspPin.h"
#endif

#ifndef test28_Blink2__M
#define test28_Blink2__M
#include "../../test28/Blink2/Blink2.h"
#endif


/*
 * ======== target data definitions (unit MspPin) ========
 */

struct test28_MspPin_ test28_MspPin = { /* module data */
};

/*
 * ======== target data definitions (unit Blink2) ========
 */

struct test28_Blink2_ test28_Blink2 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test28_Blink2_pollen__printBool(bool b) {
}
void test28_Blink2_pollen__printInt(int32 i) {
}
void test28_Blink2_pollen__printReal(float f) {
}
void test28_Blink2_pollen__printUint(uint32 u) {
}
void test28_Blink2_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test28/MspPin/MspPin.c"
#include "../../test28/Blink2/Blink2.c"

/*
 * ======== pollen.reset() ========
 */

void test28_Blink2_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test28_Blink2_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test28_Blink2_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test28_Blink2_pollen__reset__E();
    test28_MspPin_targetInit__I();
    test28_Blink2_targetInit__I();
    test28_Blink2_pollen__ready__E();
    test28_Blink2_pollen__run__E();
    test28_Blink2_pollen__shutdown__E(0);
}
