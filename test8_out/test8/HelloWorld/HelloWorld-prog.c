#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test8_Event__M
#define test8_Event__M
#include "../../test8/Event/Event.h"
#endif

#ifndef test8_HelloWorld__M
#define test8_HelloWorld__M
#include "../../test8/HelloWorld/HelloWorld.h"
#endif


/*
 * ======== target data definitions (unit HelloWorld) ========
 */

struct test8_HelloWorld_ test8_HelloWorld = { /* module data */
    null,                    /* e1 */
    null,                    /* e2 */
};

/*
 * ======== pollen print ========
 */

void test8_HelloWorld_pollen__printBool(bool b) {
}
void test8_HelloWorld_pollen__printInt(int32 i) {
}
void test8_HelloWorld_pollen__printReal(float f) {
}
void test8_HelloWorld_pollen__printUint(uint32 u) {
}
void test8_HelloWorld_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test8/Event/Event.c"
#include "../../test8/HelloWorld/HelloWorld.c"

/*
 * ======== pollen.reset() ========
 */

void test8_HelloWorld_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test8_HelloWorld_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test8_HelloWorld_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test8_HelloWorld_pollen__reset__E();
    test8_HelloWorld_targetInit__I();
    test8_HelloWorld_pollen__ready__E();
    test8_HelloWorld_pollen__run__E();
    test8_HelloWorld_pollen__shutdown__E(0);
}
