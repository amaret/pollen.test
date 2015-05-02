#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test13_YEnum__M
#define test13_YEnum__M
#include "../../test13/YEnum/YEnum.h"
#endif

#ifndef test13_Event__M
#define test13_Event__M
#include "../../test13/Event/Event.h"
#endif

#ifndef test13_HelloWorld__M
#define test13_HelloWorld__M
#include "../../test13/HelloWorld/HelloWorld.h"
#endif


/*
 * ======== target data definitions (unit HelloWorld) ========
 */

struct test13_HelloWorld_ test13_HelloWorld = { /* module data */
    null,                    /* e1 */
    null,                    /* e2 */
};

/*
 * ======== pollen print ========
 */

void test13_HelloWorld_pollen__printBool(bool b) {
}
void test13_HelloWorld_pollen__printInt(int32 i) {
}
void test13_HelloWorld_pollen__printReal(float f) {
}
void test13_HelloWorld_pollen__printUint(uint32 u) {
}
void test13_HelloWorld_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test13/Event/Event.c"
#include "../../test13/HelloWorld/HelloWorld.c"

/*
 * ======== pollen.reset() ========
 */

void test13_HelloWorld_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test13_HelloWorld_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test13_HelloWorld_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test13_HelloWorld_pollen__reset__E();
    test13_HelloWorld_targetInit__I();
    test13_HelloWorld_pollen__ready__E();
    test13_HelloWorld_pollen__run__E();
    test13_HelloWorld_pollen__shutdown__E(0);
}
