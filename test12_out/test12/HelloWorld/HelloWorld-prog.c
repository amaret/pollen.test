#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test12_Event__M
#define test12_Event__M
#include "../../test12/Event/Event.h"
#endif

#ifndef test12_HelloWorld__M
#define test12_HelloWorld__M
#include "../../test12/HelloWorld/HelloWorld.h"
#endif


/*
 * ======== target data definitions (unit HelloWorld) ========
 */

struct test12_HelloWorld_ test12_HelloWorld = { /* module data */
    null,                    /* e1 */
    null,                    /* e2 */
};

/*
 * ======== pollen print ========
 */

void test12_HelloWorld_pollen__printBool(bool b) {
}
void test12_HelloWorld_pollen__printInt(int32 i) {
}
void test12_HelloWorld_pollen__printReal(float f) {
}
void test12_HelloWorld_pollen__printUint(uint32 u) {
}
void test12_HelloWorld_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test12/Event/Event.c"
#include "../../test12/HelloWorld/HelloWorld.c"

/*
 * ======== pollen.reset() ========
 */

void test12_HelloWorld_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test12_HelloWorld_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test12_HelloWorld_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test12_HelloWorld_pollen__reset__E();
    test12_HelloWorld_targetInit__I();
    test12_HelloWorld_pollen__ready__E();
    test12_HelloWorld_pollen__run__E();
    test12_HelloWorld_pollen__shutdown__E(0);
}
