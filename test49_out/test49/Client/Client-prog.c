#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test49_Client__M
#define test49_Client__M
#include "../../test49/Client/Client.h"
#endif


/*
 * ======== target data definitions (unit Client) ========
 */

struct test49_Client_ test49_Client = { /* module data */
    null,                    /* e */
    (const uint8)0x8,    /* econst */
    (uint8)0x7,              /* x */
};

/*
 * ======== pollen print ========
 */

void test49_Client_pollen__printBool(bool b) {
}
void test49_Client_pollen__printInt(int32 i) {
}
void test49_Client_pollen__printReal(float f) {
}
void test49_Client_pollen__printUint(uint32 u) {
}
void test49_Client_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test49/Client/Client.c"

/*
 * ======== pollen.reset() ========
 */

void test49_Client_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test49_Client_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test49_Client_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test49_Client_pollen__reset__E();
    test49_Client_targetInit__E();
    test49_Client_pollen__ready__E();
    test49_Client_pollen__run__E();
    test49_Client_pollen__shutdown__E(0);
}
