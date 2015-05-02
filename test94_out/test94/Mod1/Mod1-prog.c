#include <std.h>


/*
 * ======== protocol member test94.Mod1.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef pollen_math_Absolute__M
#define pollen_math_Absolute__M
#include "../../pollen.math/Absolute/Absolute.h"
#endif

#ifndef pollen_math_FloorCeil__M
#define pollen_math_FloorCeil__M
#include "../../pollen.math/FloorCeil/FloorCeil.h"
#endif

#ifndef pollen_math_Random8__M
#define pollen_math_Random8__M
#include "../../pollen.math/Random8/Random8.h"
#endif

#ifndef pollen_math_Random16__M
#define pollen_math_Random16__M
#include "../../pollen.math/Random16/Random16.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test94_Mod1__M
#define test94_Mod1__M
#include "../../test94/Mod1/Mod1.h"
#endif


/*
 * ======== target data definitions (unit Absolute) ========
 */

struct pollen_math_Absolute_ pollen_math_Absolute = { /* module data */
};

/*
 * ======== target data definitions (unit FloorCeil) ========
 */

struct pollen_math_FloorCeil_ pollen_math_FloorCeil = { /* module data */
};

/*
 * ======== target data definitions (unit Random8) ========
 */

struct pollen_math_Random8_ pollen_math_Random8 = { /* module data */
    (uint8)0xac,             /* seed */
    (uint8)0xac,             /* lfsr */
    (uint8)0x0,              /* period */
};

/*
 * ======== target data definitions (unit Random16) ========
 */

struct pollen_math_Random16_ pollen_math_Random16 = { /* module data */
    (uint16)0xace1,          /* seed */
    (uint16)0xace1,          /* lfsr */
    (uint16)0x0,             /* period */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit Mod1) ========
 */

struct test94_Mod1_ test94_Mod1 = { /* module data */
    (int8)(-0x0 - 1),    /* i8 */
    (int16)0x3,              /* i16 */
    (int32)(-0x270e - 1),    /* i32 */
    (float)1.3,              /* f1 */
    (float)0x0,              /* f2 */
    (float)0x12c4b0,         /* f3 */
    (float)-7.5,             /* f4 */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test94_Mod1_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test94_Mod1_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test94_Mod1_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test94_Mod1_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test94_Mod1_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../pollen.math/Absolute/Absolute.c"
#include "../../pollen.math/FloorCeil/FloorCeil.c"
#include "../../pollen.math/Random8/Random8.c"
#include "../../pollen.math/Random16/Random16.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test94/Mod1/Mod1.c"

/*
 * ======== pollen.reset() ========
 */

void test94_Mod1_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test94_Mod1_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test94_Mod1_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test94_Mod1_pollen__reset__E();
    pollen_math_Absolute_targetInit__I();
    pollen_math_FloorCeil_targetInit__I();
    pollen_math_Random8_targetInit__I();
    pollen_math_Random16_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test94_Mod1_targetInit__I();
    test94_Mod1_pollen__ready__E();
    test94_Mod1_pollen__run__E();
    test94_Mod1_pollen__shutdown__E(0);
}
