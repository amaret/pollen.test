#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef atmel_atmega328_Mcu__M
#define atmel_atmega328_Mcu__M
#include "../../atmel.atmega328/Mcu/Mcu.h"
#endif

#ifndef atmel_atmega328_PD0__M
#define atmel_atmega328_PD0__M
#include "../../atmel.atmega328/PD0/PD0.h"
#endif

#ifndef test23_Blink4__M
#define test23_Blink4__M
#include "../../test23/Blink4/Blink4.h"
#endif


/*
 * ======== target data definitions (unit Mcu) ========
 */

struct atmel_atmega328_Mcu_ atmel_atmega328_Mcu = { /* module data */
    (uint32)0x0,             /* sysFreq */
};

/*
 * ======== target data definitions (unit PD0) ========
 */

struct atmel_atmega328_PD0_ atmel_atmega328_PD0 = { /* module data */
};

/*
 * ======== target data definitions (unit Blink4) ========
 */

struct test23_Blink4_ test23_Blink4 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test23_Blink4_pollen__printBool(bool b) {
}
void test23_Blink4_pollen__printInt(int32 i) {
}
void test23_Blink4_pollen__printReal(float f) {
}
void test23_Blink4_pollen__printUint(uint32 u) {
}
void test23_Blink4_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../atmel.atmega328/Mcu/Mcu.c"
#include "../../atmel.atmega328/PD0/PD0.c"
#include "../../test23/Blink4/Blink4.c"

/*
 * ======== pollen.ready() ========
 */

void test23_Blink4_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test23_Blink4_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test23_Blink4_pollen__reset__E();
    atmel_atmega328_Mcu_targetInit__I();
    atmel_atmega328_PD0_targetInit__I();
    test23_Blink4_targetInit__I();
    test23_Blink4_pollen__ready__E();
    test23_Blink4_pollen__run__E();
    test23_Blink4_pollen__shutdown__E(0);
}
