#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef atmel_atmega328_PD0__M
#define atmel_atmega328_PD0__M
#include "../../atmel.atmega328/PD0/PD0.h"
#endif

#ifndef test20_Blink1__M
#define test20_Blink1__M
#include "../../test20/Blink1/Blink1.h"
#endif


/*
 * ======== target data definitions (unit PD0) ========
 */

struct atmel_atmega328_PD0_ atmel_atmega328_PD0 = { /* module data */
};

/*
 * ======== target data definitions (unit Blink1) ========
 */

struct test20_Blink1_ test20_Blink1 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test20_Blink1_pollen__printBool(bool b) {
}
void test20_Blink1_pollen__printInt(int32 i) {
}
void test20_Blink1_pollen__printReal(float f) {
}
void test20_Blink1_pollen__printUint(uint32 u) {
}
void test20_Blink1_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../atmel.atmega328/PD0/PD0.c"
#include "../../test20/Blink1/Blink1.c"

/*
 * ======== pollen.ready() ========
 */

void test20_Blink1_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test20_Blink1_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test20_Blink1_pollen__reset__E();
    atmel_atmega328_PD0_targetInit__I();
    test20_Blink1_targetInit__I();
    test20_Blink1_pollen__ready__E();
    test20_Blink1_pollen__run__E();
    test20_Blink1_pollen__shutdown__E(0);
}
