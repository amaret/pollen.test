#include <std.h>


/*
 * ======== protocol member test122.TestProg.proto1 delegates test122_Module1 ========
 */

#ifndef test122_Module1__M
#define test122_Module1__M
#include "../../test122/Module1/Module1.h"
#endif


/*
 * ======== protocol member test122.TestProg.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== protocol member test122.TestProg.pollenSleepWakeProxy delegates test122_SleepWakeImpl ========
 */

#ifndef test122_SleepWakeImpl__M
#define test122_SleepWakeImpl__M
#include "../../test122/SleepWakeImpl/SleepWakeImpl.h"
#endif


/*
 * ======== protocol member test122.TestProg.pollenDynamicMemoryProxy delegates test122_DynMemImpl ========
 */

#ifndef test122_DynMemImpl__M
#define test122_DynMemImpl__M
#include "../../test122/DynMemImpl/DynMemImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test122_SleepWakeImpl__M
#define test122_SleepWakeImpl__M
#include "../../test122/SleepWakeImpl/SleepWakeImpl.h"
#endif

#ifndef test122_DynMemImpl__M
#define test122_DynMemImpl__M
#include "../../test122/DynMemImpl/DynMemImpl.h"
#endif

#ifndef test122_Module1__M
#define test122_Module1__M
#include "../../test122/Module1/Module1.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test122_TestProg__M
#define test122_TestProg__M
#include "../../test122/TestProg/TestProg.h"
#endif


/*
 * ======== target data definitions (unit SleepWakeImpl) ========
 */

struct test122_SleepWakeImpl_ test122_SleepWakeImpl = { /* module data */
};

/*
 * ======== target data definitions (unit DynMemImpl) ========
 */

struct test122_DynMemImpl_ test122_DynMemImpl = { /* module data */
};

/*
 * ======== target data definitions (unit Module1) ========
 */

struct test122_Module1_ test122_Module1 = { /* module data */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test122_TestProg_ test122_TestProg = { /* module data */
    &test122_Module1,    /* proto1 */
    &test54_PrintImpl,    /* pollenPrintProxy */
    &test122_SleepWakeImpl,    /* pollenSleepWakeProxy */
    &test122_DynMemImpl,    /* pollenDynamicMemoryProxy */
};

/*
 * ======== pollen print ========
 */

void test122_TestProg_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test122_TestProg_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test122_TestProg_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test122_TestProg_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test122_TestProg_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test122/SleepWakeImpl/SleepWakeImpl.c"
#include "../../test122/DynMemImpl/DynMemImpl.c"
#include "../../test122/Module1/Module1.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test122/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test122_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test122_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test122_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test122_TestProg_pollen__reset__E();
    test122_SleepWakeImpl_targetInit__I();
    test122_DynMemImpl_targetInit__I();
    test122_Module1_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test122_TestProg_targetInit__I();
    test122_TestProg_pollen__ready__E();
    test122_TestProg_pollen__run__E();
    test122_TestProg_pollen__shutdown__E(0);
}
