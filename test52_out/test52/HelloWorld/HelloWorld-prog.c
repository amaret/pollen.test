#include <std.h>


/*
 * ======== protocol member test52.HelloWorld.fp delegates test52_FcnImpl ========
 */

#ifndef test52_FcnImpl__M
#define test52_FcnImpl__M
#include "../../test52/FcnImpl/FcnImpl.h"
#endif


/*
 * ======== protocol member test52.HelloWorld.pollenPrintProxy delegates test61_PrintImpl ========
 */

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test52_FcnImpl__M
#define test52_FcnImpl__M
#include "../../test52/FcnImpl/FcnImpl.h"
#endif

#ifndef test52_Event__M
#define test52_Event__M
#include "../../test52/Event/Event.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif

#ifndef test52_HelloWorld__M
#define test52_HelloWorld__M
#include "../../test52/HelloWorld/HelloWorld.h"
#endif


/*
 * ======== target data definitions (unit FcnImpl) ========
 */

struct test52_FcnImpl_ test52_FcnImpl = { /* module data */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test61_PrintImpl_ test61_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit HelloWorld) ========
 */

struct test52_HelloWorld_ test52_HelloWorld = { /* module data */
    null,                    /* e1 */
    null,                    /* e2 */
    &test52_FcnImpl,         /* fp */
    test52_FcnImpl_foo_proto__E,    /* fp_impl */
    test52_FcnImpl_foo_proto__E,    /* proto_ref */
    test52_FcnImpl_foo_proto__E,    /* fp_impl2 */
    test52_HelloWorld_Inner_foo__I,    /* clsFcnRef */
    test52_FcnImpl_foo_proto__E,    /* modFcnRef */
    test52_HelloWorld_foo__I,    /* foo_uint8 */
    test52_HelloWorld_foo2__I,    /* foo2_uint32_rtn */
    test52_HelloWorld_bar__I,    /* bar_uint8 */
    test52_HelloWorld_bar2__I,    /* bar2_bool */
    test52_HelloWorld_bar3__I,    /* bar3_uint32 */
    test52_HelloWorld_bar4__I,    /* bar4_uint32_and_rtn */
    test52_HelloWorld_bar5__I,    /* bar5_uint16 */
    test52_HelloWorld_bar5_and_rtn__I,    /* bar5_uint16_and_rtn */
    &test61_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test52_HelloWorld_pollen__printBool(bool b) {
    test61_PrintImpl_printBool__E(b);
}
void test52_HelloWorld_pollen__printInt(int32 i) {
    test61_PrintImpl_printInt__E(i);
}
void test52_HelloWorld_pollen__printReal(float f) {
    test61_PrintImpl_printReal__E(f);
}
void test52_HelloWorld_pollen__printUint(uint32 u) {
    test61_PrintImpl_printUint__E(u);
}
void test52_HelloWorld_pollen__printStr(string s) {
    test61_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test52/FcnImpl/FcnImpl.c"
#include "../../test52/Event/Event.c"
#include "../../test61/PrintImpl/PrintImpl.c"
#include "../../test52/HelloWorld/HelloWorld.c"

/*
 * ======== pollen.reset() ========
 */

void test52_HelloWorld_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test52_HelloWorld_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test52_HelloWorld_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test52_HelloWorld_pollen__reset__E();
    test52_FcnImpl_targetInit__I();
    test61_PrintImpl_targetInit__I();
    test52_HelloWorld_targetInit__I();
    test52_HelloWorld_pollen__ready__E();
    test52_HelloWorld_pollen__run__E();
    test52_HelloWorld_pollen__shutdown__E(0);
}
