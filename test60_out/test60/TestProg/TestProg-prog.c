#include <std.h>


/*
 * ======== protocol member test60.TestProg.pollenPrintProxy delegates test60_PrintImpl ========
 */

#ifndef test60_PrintImpl__M
#define test60_PrintImpl__M
#include "../../test60/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test60_Cpu__M
#define test60_Cpu__M
#include "../../test60/Cpu/Cpu.h"
#endif

#ifndef test60_PrintImpl__M
#define test60_PrintImpl__M
#include "../../test60/PrintImpl/PrintImpl.h"
#endif

#ifndef test60_TestProg__M
#define test60_TestProg__M
#include "../../test60/TestProg/TestProg.h"
#endif


/*
 * ======== host data definitions (unit Cpu) ========
 */

const test60_Cpu_freq__TYPE test60_Cpu_freq__V = (uint32)0x6;

/*
 * ======== target data definitions (unit Cpu) ========
 */

struct test60_Cpu_ test60_Cpu = { /* module data */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test60_PrintImpl_ test60_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit TestProg) ========
 */

const test60_TestProg_test_freq__TYPE test60_TestProg_test_freq__V = (uint32)0x6;

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test60_TestProg_ test60_TestProg = { /* module data */
    &test60_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test60_TestProg_pollen__printBool(bool b) {
    test60_PrintImpl_printBool__E(b);
}
void test60_TestProg_pollen__printInt(int32 i) {
    test60_PrintImpl_printInt__E(i);
}
void test60_TestProg_pollen__printReal(float f) {
    test60_PrintImpl_printReal__E(f);
}
void test60_TestProg_pollen__printUint(uint32 u) {
    test60_PrintImpl_printUint__E(u);
}
void test60_TestProg_pollen__printStr(string s) {
    test60_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test60/Cpu/Cpu.c"
#include "../../test60/PrintImpl/PrintImpl.c"
#include "../../test60/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test60_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test60_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test60_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test60_TestProg_pollen__reset__E();
    test60_Cpu_targetInit__I();
    test60_PrintImpl_targetInit__I();
    test60_TestProg_targetInit__I();
    test60_TestProg_pollen__ready__E();
    test60_TestProg_pollen__run__E();
    test60_TestProg_pollen__shutdown__E(0);
}
