#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test11_Event__M
#define test11_Event__M
#include "../../test11/Event/Event.h"
#endif

#ifndef test11_HelloWorld__M
#define test11_HelloWorld__M
#include "../../test11/HelloWorld/HelloWorld.h"
#endif


/*
 * ======== target data definitions (unit HelloWorld) ========
 */

struct test11_HelloWorld_ test11_HelloWorld = { /* module data */
    null,                    /* e1 */
    null,                    /* e2 */
};

/*
 * ======== pollen print ========
 */

void test11_HelloWorld_pollen__printBool(bool b) {
}
void test11_HelloWorld_pollen__printInt(int32 i) {
}
void test11_HelloWorld_pollen__printReal(float f) {
}
void test11_HelloWorld_pollen__printUint(uint32 u) {
}
void test11_HelloWorld_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test11/Event/Event.c"
#include "../../test11/HelloWorld/HelloWorld.c"

/*
 * ======== pollen.reset() ========
 */

void test11_HelloWorld_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test11_HelloWorld_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test11_HelloWorld_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test11_HelloWorld_pollen__reset__E();
    test11_HelloWorld_targetInit__I();
    test11_HelloWorld_pollen__ready__E();
    test11_HelloWorld_pollen__run__E();
    test11_HelloWorld_pollen__shutdown__E(0);
}
