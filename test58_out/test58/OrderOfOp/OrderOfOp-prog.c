#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test58_IncArrTest__M
#define test58_IncArrTest__M
#include "../../test58/IncArrTest/IncArrTest.h"
#endif

#ifndef test58_OrderOfOp__M
#define test58_OrderOfOp__M
#include "../../test58/OrderOfOp/OrderOfOp.h"
#endif


/*
 * ======== target data definitions (unit IncArrTest) ========
 */

struct test58_IncArrTest_ test58_IncArrTest = { /* module data */
    {
        (uint8)0x0,  /* [0] */
    },    /* arr */
};

/*
 * ======== target data definitions (unit OrderOfOp) ========
 */

struct test58_OrderOfOp_ test58_OrderOfOp = { /* module data */
    (const uint8)0x0,    /* NOFADE */
    (uint8)0x0,              /* fading */
    (uint8)0x0,              /* fadecount */
};

/*
 * ======== pollen print ========
 */

void test58_OrderOfOp_pollen__printBool(bool b) {
}
void test58_OrderOfOp_pollen__printInt(int32 i) {
}
void test58_OrderOfOp_pollen__printReal(float f) {
}
void test58_OrderOfOp_pollen__printUint(uint32 u) {
}
void test58_OrderOfOp_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test58/IncArrTest/IncArrTest.c"
#include "../../test58/OrderOfOp/OrderOfOp.c"

/*
 * ======== pollen.reset() ========
 */

void test58_OrderOfOp_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test58_OrderOfOp_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test58_OrderOfOp_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test58_OrderOfOp_pollen__reset__E();
    test58_IncArrTest_targetInit__I();
    test58_OrderOfOp_targetInit__I();
    test58_OrderOfOp_pollen__ready__E();
    test58_OrderOfOp_pollen__run__E();
    test58_OrderOfOp_pollen__shutdown__E(0);
}
