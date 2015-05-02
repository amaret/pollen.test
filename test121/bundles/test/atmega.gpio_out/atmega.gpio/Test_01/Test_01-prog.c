#include <std.h>


/*
 * ======== protocol member atmega.gpio.Test_01.intrinsicPrintProtocol delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef atmel_atmega_Cpu__M
#define atmel_atmega_Cpu__M
#include "../../atmel.atmega/Cpu/Cpu.h"
#endif

#ifndef atmel_atmega_PB4__M
#define atmel_atmega_PB4__M
#include "../../atmel.atmega/PB4/PB4.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef atmega_gpio_Test_01__M
#define atmega_gpio_Test_01__M
#include "../../atmega.gpio/Test_01/Test_01.h"
#endif


/*
 * ======== host data definitions (unit Cpu) ========
 */

const atmel_atmega_Cpu_ticksPerUs__TYPE atmel_atmega_Cpu_ticksPerUs__V = (uint32)0x10;

/*
 * ======== target data definitions (unit Cpu) ========
 */

struct atmel_atmega_Cpu_ atmel_atmega_Cpu = { /* module data */
    (uint32)0xf42400,    /* sysFreq */
};

/*
 * ======== host data definitions (unit PB4) ========
 */

const atmel_atmega_PB4_pinMask__TYPE atmel_atmega_PB4_pinMask__V = (uint8)0x10;

/*
 * ======== target data definitions (unit PB4) ========
 */

struct atmel_atmega_PB4_ atmel_atmega_PB4 = { /* module data */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit Test_01) ========
 */

struct atmega_gpio_Test_01_ atmega_gpio_Test_01 = { /* module data */
    &test54_PrintImpl,    /* intrinsicPrintProtocol */
};

/*
 * ======== pollen.print ========
 */

void atmega_gpio_Test_01_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void atmega_gpio_Test_01_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void atmega_gpio_Test_01_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void atmega_gpio_Test_01_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void atmega_gpio_Test_01_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../atmel.atmega/Cpu/Cpu.c"
#include "../../atmel.atmega/PB4/PB4.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../atmega.gpio/Test_01/Test_01.c"

/*
 * ======== pollen.reset() ========
 */

void atmega_gpio_Test_01_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8 id) ========
 */

void atmega_gpio_Test_01_pollen__shutdown__E(uint8 id) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== pollen.wake(uint8 id) ========
 */

void atmega_gpio_Test_01_pollen__wake__E(uint8 id) {
    /* empty default */
}

/*
 * ======== pollen.hibernate(uint8 id) ========
 */

void atmega_gpio_Test_01_pollen__hibernate__E(uint8 id) {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    atmega_gpio_Test_01_pollen__reset__E();
    atmel_atmega_Cpu_targetInit__I();
    atmel_atmega_PB4_targetInit__I();
    test54_PrintImpl_targetInit__I();
    atmega_gpio_Test_01_targetInit__I();
    atmega_gpio_Test_01_pollen__ready__E();
    atmega_gpio_Test_01_pollen__run__E();
    atmega_gpio_Test_01_pollen__shutdown__E(0);
}
