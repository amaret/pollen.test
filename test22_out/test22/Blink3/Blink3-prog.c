#include <std.h>


/*
 * ======== protocol member test22.Blink3.pin delegates atmel_atmega328_PD0 ========
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

#ifndef test22_Blink3__M
#define test22_Blink3__M
#include "../../test22/Blink3/Blink3.h"
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
 * ======== target data definitions (unit Blink3) ========
 */

struct test22_Blink3_ test22_Blink3 = { /* module data */
    &atmel_atmega328_PD0,    /* pin */
};

/*
 * ======== pollen print ========
 */

void test22_Blink3_pollen__printBool(bool b) {
}
void test22_Blink3_pollen__printInt(int32 i) {
}
void test22_Blink3_pollen__printReal(float f) {
}
void test22_Blink3_pollen__printUint(uint32 u) {
}
void test22_Blink3_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../atmel.atmega328/Mcu/Mcu.c"
#include "../../atmel.atmega328/PD0/PD0.c"
#include "../../test22/Blink3/Blink3.c"

/*
 * ======== pollen.ready() ========
 */

void test22_Blink3_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test22_Blink3_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test22_Blink3_pollen__reset__E();
    atmel_atmega328_Mcu_targetInit__I();
    atmel_atmega328_PD0_targetInit__I();
    test22_Blink3_targetInit__I();
    test22_Blink3_pollen__ready__E();
    test22_Blink3_pollen__run__E();
    test22_Blink3_pollen__shutdown__E(0);
}
