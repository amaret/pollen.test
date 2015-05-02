#include <std.h>


/*
 * ======== protocol member pollen.hardware.Led.pin delegates atmel_atmega8_PB5 ========
 */

#ifndef atmel_atmega8_PB5__M
#define atmel_atmega8_PB5__M
#include "../../atmel.atmega8/PB5/PB5.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef atmel_atmega8_Core__M
#define atmel_atmega8_Core__M
#include "../../atmel.atmega8/Core/Core.h"
#endif

#ifndef atmel_atmega8_PB5__M
#define atmel_atmega8_PB5__M
#include "../../atmel.atmega8/PB5/PB5.h"
#endif

#ifndef pollen_hardware_Led__M
#define pollen_hardware_Led__M
#include "../../pollen.hardware/Led/Led.h"
#endif

#ifndef test44_BlinkEnvPin__M
#define test44_BlinkEnvPin__M
#include "../../test44/BlinkEnvPin/BlinkEnvPin.h"
#endif


/*
 * ======== host data definitions (unit Core) ========
 */

const atmel_atmega8_Core_nops__TYPE atmel_atmega8_Core_nops__V = (uint8)0x8;

/*
 * ======== target data definitions (unit Core) ========
 */

struct atmel_atmega8_Core_ atmel_atmega8_Core = { /* module data */
    (uint32)0x0,             /* sysFreq */
};

/*
 * ======== target data definitions (unit PB5) ========
 */

struct atmel_atmega8_PB5_ atmel_atmega8_PB5 = { /* module data */
};

/*
 * ======== target data definitions (unit Led) ========
 */

struct pollen_hardware_Led_ pollen_hardware_Led = { /* module data */
    &atmel_atmega8_PB5,    /* pin */
};

/*
 * ======== target data definitions (unit BlinkEnvPin) ========
 */

struct test44_BlinkEnvPin_ test44_BlinkEnvPin = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test44_BlinkEnvPin_pollen__printBool(bool b) {
}
void test44_BlinkEnvPin_pollen__printInt(int32 i) {
}
void test44_BlinkEnvPin_pollen__printReal(float f) {
}
void test44_BlinkEnvPin_pollen__printUint(uint32 u) {
}
void test44_BlinkEnvPin_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../atmel.atmega8/Core/Core.c"
#include "../../atmel.atmega8/PB5/PB5.c"
#include "../../pollen.hardware/Led/Led.c"
#include "../../test44/BlinkEnvPin/BlinkEnvPin.c"

/*
 * ======== pollen.ready() ========
 */

void test44_BlinkEnvPin_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test44_BlinkEnvPin_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test44_BlinkEnvPin_pollen__reset__E();
    atmel_atmega8_Core_targetInit__I();
    atmel_atmega8_PB5_targetInit__I();
    pollen_hardware_Led_targetInit__I();
    test44_BlinkEnvPin_targetInit__I();
    test44_BlinkEnvPin_pollen__ready__E();
    test44_BlinkEnvPin_pollen__run__E();
    test44_BlinkEnvPin_pollen__shutdown__E(0);
}
