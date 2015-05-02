#include <std.h>


/*
 * ======== enum definitions (unit PEnum1) ========
 */

typedef uint8 test80_ProtoEnum_PEnum1;
#define test80_ProtoEnum_PEnum1_SCLK 2
#define test80_ProtoEnum_PEnum1_ACLK 7
#define test80_ProtoEnum_PEnum1_NEXT 8
#define test80_ProtoEnum_PEnum1_LAST 9

/*
 * ======== enum definitions (unit PEnum2) ========
 */

typedef uint8 test80_ProtoEnum_PEnum2;
#define test80_ProtoEnum_PEnum2_FIRST 0
#define test80_ProtoEnum_PEnum2_NEXT 1
#define test80_ProtoEnum_PEnum2_LAST 2

/*
 * ======== enum definitions (unit CEnum1) ========
 */

typedef uint8 test80_CompEnum_CEnum1;
#define test80_CompEnum_CEnum1_SCLK 02
#define test80_CompEnum_CEnum1_ACLK 0x7
#define test80_CompEnum_CEnum1_NEXT 999999
#define test80_CompEnum_CEnum1_LAST 64

/*
 * ======== enum definitions (unit CEnum2) ========
 */

typedef uint8 test80_CompEnum_CEnum2;
#define test80_CompEnum_CEnum2_FIRST 0
#define test80_CompEnum_CEnum2_NEXT 1
#define test80_CompEnum_CEnum2_LAST 2

/*
 * ======== protocol member test80.HelloWorld.pollenPrintProxy delegates test61_PrintImpl ========
 */

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test80_ModEnum__M
#define test80_ModEnum__M
#include "../../test80/ModEnum/ModEnum.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif

#ifndef test80_HelloWorld__M
#define test80_HelloWorld__M
#include "../../test80/HelloWorld/HelloWorld.h"
#endif


/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test61_PrintImpl_ test61_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit HelloWorld) ========
 */

struct test80_HelloWorld_ test80_HelloWorld = { /* module data */
    null,                    /* x */
    &test61_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test80_HelloWorld_pollen__printBool(bool b) {
    test61_PrintImpl_printBool__E(b);
}
void test80_HelloWorld_pollen__printInt(int32 i) {
    test61_PrintImpl_printInt__E(i);
}
void test80_HelloWorld_pollen__printReal(float f) {
    test61_PrintImpl_printReal__E(f);
}
void test80_HelloWorld_pollen__printUint(uint32 u) {
    test61_PrintImpl_printUint__E(u);
}
void test80_HelloWorld_pollen__printStr(string s) {
    test61_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test61/PrintImpl/PrintImpl.c"
#include "../../test80/HelloWorld/HelloWorld.c"

/*
 * ======== pollen.reset() ========
 */

void test80_HelloWorld_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test80_HelloWorld_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test80_HelloWorld_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test80_HelloWorld_pollen__reset__E();
    test61_PrintImpl_targetInit__I();
    test80_HelloWorld_targetInit__I();
    test80_HelloWorld_pollen__ready__E();
    test80_HelloWorld_pollen__run__E();
    test80_HelloWorld_pollen__shutdown__E(0);
}
