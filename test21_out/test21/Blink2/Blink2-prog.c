#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef atmel_atmega328_Mcu__M
#define atmel_atmega328_Mcu__M
#include "../../atmel.atmega328/Mcu/Mcu.h"
#endif

#ifndef atmel_atmega328_PB5__M
#define atmel_atmega328_PB5__M
#include "../../atmel.atmega328/PB5/PB5.h"
#endif

#ifndef test21_Blink2__M
#define test21_Blink2__M
#include "../../test21/Blink2/Blink2.h"
#endif


/*
 * ======== target data definitions (unit Mcu) ========
 */

struct atmel_atmega328_Mcu_ atmel_atmega328_Mcu = { /* module data */
    (uint32)0x0,             /* sysFreq */
};

/*
 * ======== target data definitions (unit PB5) ========
 */

struct atmel_atmega328_PB5_ atmel_atmega328_PB5 = { /* module data */
};

/*
 * ======== target data definitions (unit Blink2) ========
 */

struct test21_Blink2_ test21_Blink2 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test21_Blink2_pollen__printBool(bool b) {
}
void test21_Blink2_pollen__printInt(int32 i) {
}
void test21_Blink2_pollen__printReal(float f) {
}
void test21_Blink2_pollen__printUint(uint32 u) {
}
void test21_Blink2_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../atmel.atmega328/Mcu/Mcu.c"
#include "../../atmel.atmega328/PB5/PB5.c"
#include "../../test21/Blink2/Blink2.c"

/*
 * ======== pollen.ready() ========
 */

void test21_Blink2_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test21_Blink2_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test21_Blink2_pollen__reset__E();
    atmel_atmega328_Mcu_targetInit__I();
    atmel_atmega328_PB5_targetInit__I();
    test21_Blink2_targetInit__I();
    test21_Blink2_pollen__ready__E();
    test21_Blink2_pollen__run__E();
    test21_Blink2_pollen__shutdown__E(0);
}
