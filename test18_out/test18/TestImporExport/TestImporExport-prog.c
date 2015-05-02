#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test18_Atmega328p__M
#define test18_Atmega328p__M
#include "../../test18/Atmega328p/Atmega328p.h"
#endif

#ifndef test18_GlobalInterrupts__M
#define test18_GlobalInterrupts__M
#include "../../test18/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef test18_TestImporExport__M
#define test18_TestImporExport__M
#include "../../test18/TestImporExport/TestImporExport.h"
#endif


/*
 * ======== target data definitions (unit Atmega328p) ========
 */

struct test18_Atmega328p_ test18_Atmega328p = { /* module data */
    (uint32)0x0,             /* sysFreq */
};

/*
 * ======== target data definitions (unit GlobalInterrupts) ========
 */

struct test18_GlobalInterrupts_ test18_GlobalInterrupts = { /* module data */
};

/*
 * ======== target data definitions (unit TestImporExport) ========
 */

struct test18_TestImporExport_ test18_TestImporExport = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test18_TestImporExport_pollen__printBool(bool b) {
}
void test18_TestImporExport_pollen__printInt(int32 i) {
}
void test18_TestImporExport_pollen__printReal(float f) {
}
void test18_TestImporExport_pollen__printUint(uint32 u) {
}
void test18_TestImporExport_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test18/Atmega328p/Atmega328p.c"
#include "../../test18/GlobalInterrupts/GlobalInterrupts.c"
#include "../../test18/TestImporExport/TestImporExport.c"

/*
 * ======== pollen.ready() ========
 */

void test18_TestImporExport_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test18_TestImporExport_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test18_TestImporExport_pollen__reset__E();
    test18_Atmega328p_targetInit__I();
    test18_GlobalInterrupts_targetInit__I();
    test18_TestImporExport_targetInit__I();
    test18_TestImporExport_pollen__ready__E();
    test18_TestImporExport_pollen__run__E();
    test18_TestImporExport_pollen__shutdown__E(0);
}
