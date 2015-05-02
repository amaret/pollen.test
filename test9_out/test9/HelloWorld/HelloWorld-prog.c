#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test9_Event__M
#define test9_Event__M
#include "../../test9/Event/Event.h"
#endif

#ifndef test9_HelloWorld__M
#define test9_HelloWorld__M
#include "../../test9/HelloWorld/HelloWorld.h"
#endif


/*
 * ======== target data definitions (unit HelloWorld) ========
 */

struct test9_HelloWorld_ test9_HelloWorld = { /* module data */
    null,                    /* e1 */
    null,                    /* e2 */
};

/*
 * ======== pollen print ========
 */

void test9_HelloWorld_pollen__printBool(bool b) {
}
void test9_HelloWorld_pollen__printInt(int32 i) {
}
void test9_HelloWorld_pollen__printReal(float f) {
}
void test9_HelloWorld_pollen__printUint(uint32 u) {
}
void test9_HelloWorld_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test9/Event/Event.c"
#include "../../test9/HelloWorld/HelloWorld.c"

/*
 * ======== pollen.reset() ========
 */

void test9_HelloWorld_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test9_HelloWorld_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test9_HelloWorld_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test9_HelloWorld_pollen__reset__E();
    test9_HelloWorld_targetInit__I();
    test9_HelloWorld_pollen__ready__E();
    test9_HelloWorld_pollen__run__E();
    test9_HelloWorld_pollen__shutdown__E(0);
}
