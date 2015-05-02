#include <std.h>


/*
 * ======== protocol member test121.Test_01.pollenPrintProxy delegates test54_PrintImpl ========
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

#ifndef test121_Test_01__M
#define test121_Test_01__M
#include "../../test121/Test_01/Test_01.h"
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

struct test121_Test_01_ test121_Test_01 = { /* module data */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test121_Test_01_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test121_Test_01_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test121_Test_01_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test121_Test_01_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test121_Test_01_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../atmel.atmega/Cpu/Cpu.c"
#include "../../atmel.atmega/PB4/PB4.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test121/Test_01/Test_01.c"

/*
 * ======== pollen.reset() ========
 */

void test121_Test_01_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test121_Test_01_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test121_Test_01_pollen__reset__E();
    atmel_atmega_Cpu_targetInit__I();
    atmel_atmega_PB4_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test121_Test_01_targetInit__I();
    test121_Test_01_pollen__ready__E();
    test121_Test_01_pollen__run__E();
    test121_Test_01_pollen__shutdown__E(0);
}
