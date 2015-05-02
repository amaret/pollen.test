#include <std.h>


/*
 * ======== protocol member test84.MetaPinTestMod.pollenPrintProxy delegates test61_PrintImpl ========
 */

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test84_MPT1__M
#define test84_MPT1__M
#include "../../test84/MPT1/MPT1.h"
#endif

#ifndef test84_MPT2__M
#define test84_MPT2__M
#include "../../test84/MPT2/MPT2.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif

#ifndef test84_MetaPinTestMod__M
#define test84_MetaPinTestMod__M
#include "../../test84/MetaPinTestMod/MetaPinTestMod.h"
#endif


/*
 * ======== target data definitions (unit MPT1) ========
 */

struct test84_MPT1_ test84_MPT1 = { /* module data */
};

/*
 * ======== target data definitions (unit MPT2) ========
 */

struct test84_MPT2_ test84_MPT2 = { /* module data */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test61_PrintImpl_ test61_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit MetaPinTestMod) ========
 */

struct test84_MetaPinTestMod_ test84_MetaPinTestMod = { /* module data */
    &test61_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test84_MetaPinTestMod_pollen__printBool(bool b) {
    test61_PrintImpl_printBool__E(b);
}
void test84_MetaPinTestMod_pollen__printInt(int32 i) {
    test61_PrintImpl_printInt__E(i);
}
void test84_MetaPinTestMod_pollen__printReal(float f) {
    test61_PrintImpl_printReal__E(f);
}
void test84_MetaPinTestMod_pollen__printUint(uint32 u) {
    test61_PrintImpl_printUint__E(u);
}
void test84_MetaPinTestMod_pollen__printStr(string s) {
    test61_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test84/MPT1/MPT1.c"
#include "../../test84/MPT2/MPT2.c"
#include "../../test61/PrintImpl/PrintImpl.c"
#include "../../test84/MetaPinTestMod/MetaPinTestMod.c"

/*
 * ======== pollen.reset() ========
 */

void test84_MetaPinTestMod_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test84_MetaPinTestMod_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test84_MetaPinTestMod_pollen__reset__E();
    test84_MPT1_targetInit__I();
    test84_MPT2_targetInit__I();
    test61_PrintImpl_targetInit__I();
    test84_MetaPinTestMod_targetInit__I();
    test84_MetaPinTestMod_pollen__ready__E();
    test84_MetaPinTestMod_pollen__run__E();
    test84_MetaPinTestMod_pollen__shutdown__E(0);
}
