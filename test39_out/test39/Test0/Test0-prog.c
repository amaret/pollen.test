#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef atmel_atmega8_Timer0MatchA__M
#define atmel_atmega8_Timer0MatchA__M
#include "../../atmel.atmega8/Timer0MatchA/Timer0MatchA.h"
#endif

#ifndef test39_Test0__M
#define test39_Test0__M
#include "../../test39/Test0/Test0.h"
#endif


/*
 * ======== target data definitions (unit Timer0MatchA) ========
 */

struct atmel_atmega8_Timer0MatchA_ atmel_atmega8_Timer0MatchA = { /* module data */
    test39_Test0_isr__I,    /* handler */
};

/*
 * ======== target data definitions (unit Test0) ========
 */

struct test39_Test0_ test39_Test0 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test39_Test0_pollen__printBool(bool b) {
}
void test39_Test0_pollen__printInt(int32 i) {
}
void test39_Test0_pollen__printReal(float f) {
}
void test39_Test0_pollen__printUint(uint32 u) {
}
void test39_Test0_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../atmel.atmega8/Timer0MatchA/Timer0MatchA.c"
#include "../../test39/Test0/Test0.c"

/*
 * ======== pollen.reset() ========
 */

void test39_Test0_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test39_Test0_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test39_Test0_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test39_Test0_pollen__reset__E();
    atmel_atmega8_Timer0MatchA_targetInit__I();
    test39_Test0_targetInit__I();
    test39_Test0_pollen__ready__E();
    test39_Test0_pollen__run__E();
    test39_Test0_pollen__shutdown__E(0);
}
