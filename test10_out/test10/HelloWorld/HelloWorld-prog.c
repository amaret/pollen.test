#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test10_Event__M
#define test10_Event__M
#include "../../test10/Event/Event.h"
#endif

#ifndef test10_HelloWorld__M
#define test10_HelloWorld__M
#include "../../test10/HelloWorld/HelloWorld.h"
#endif


/*
 * ======== target data definitions (unit HelloWorld) ========
 */

struct test10_HelloWorld_ test10_HelloWorld = { /* module data */
    null,                    /* e1 */
    null,                    /* e2 */
};

/*
 * ======== pollen print ========
 */

void test10_HelloWorld_pollen__printBool(bool b) {
}
void test10_HelloWorld_pollen__printInt(int32 i) {
}
void test10_HelloWorld_pollen__printReal(float f) {
}
void test10_HelloWorld_pollen__printUint(uint32 u) {
}
void test10_HelloWorld_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test10/Event/Event.c"
#include "../../test10/HelloWorld/HelloWorld.c"

/*
 * ======== pollen.reset() ========
 */

void test10_HelloWorld_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test10_HelloWorld_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test10_HelloWorld_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test10_HelloWorld_pollen__reset__E();
    test10_HelloWorld_targetInit__I();
    test10_HelloWorld_pollen__ready__E();
    test10_HelloWorld_pollen__run__E();
    test10_HelloWorld_pollen__shutdown__E(0);
}
