#include <std.h>


/*
 * ======== protocol member test24.Blink5.pin delegates atmel_atmega328_PD0 ========
 */

#ifndef atmel_atmega328_PD0__M
#define atmel_atmega328_PD0__M
#include "../../atmel.atmega328/PD0/PD0.h"
#endif


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

#ifndef test24_Blink5__M
#define test24_Blink5__M
#include "../../test24/Blink5/Blink5.h"
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
 * ======== target data definitions (unit Blink5) ========
 */

struct test24_Blink5_ test24_Blink5 = { /* module data */
    &atmel_atmega328_PD0,    /* pin */
};

/*
 * ======== pollen print ========
 */

void test24_Blink5_pollen__printBool(bool b) {
}
void test24_Blink5_pollen__printInt(int32 i) {
}
void test24_Blink5_pollen__printReal(float f) {
}
void test24_Blink5_pollen__printUint(uint32 u) {
}
void test24_Blink5_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../atmel.atmega328/Mcu/Mcu.c"
#include "../../atmel.atmega328/PD0/PD0.c"
#include "../../test24/Blink5/Blink5.c"

/*
 * ======== pollen.ready() ========
 */

void test24_Blink5_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test24_Blink5_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test24_Blink5_pollen__reset__E();
    atmel_atmega328_Mcu_targetInit__I();
    atmel_atmega328_PD0_targetInit__I();
    test24_Blink5_targetInit__I();
    test24_Blink5_pollen__ready__E();
    test24_Blink5_pollen__run__E();
    test24_Blink5_pollen__shutdown__E(0);
}
