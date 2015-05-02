#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test45_M__M
#define test45_M__M
#include "../../test45/M/M.h"
#endif

#ifndef test45_Q__M
#define test45_Q__M
#include "../../test45/Q/Q.h"
#endif

#ifndef test45_Test10__M
#define test45_Test10__M
#include "../../test45/Test10/Test10.h"
#endif


/*
 * ======== target data definitions (unit M) ========
 */

struct test45_M_ test45_M = { /* module data */
};

/*
 * ======== target data definitions (unit Q) ========
 */

struct test45_Q_ test45_Q = { /* module data */
};

/*
 * ======== target data definitions (unit Test10) ========
 */

struct test45_Test10_ test45_Test10 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test45_Test10_pollen__printBool(bool b) {
}
void test45_Test10_pollen__printInt(int32 i) {
}
void test45_Test10_pollen__printReal(float f) {
}
void test45_Test10_pollen__printUint(uint32 u) {
}
void test45_Test10_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test45/M/M.c"
#include "../../test45/Q/Q.c"
#include "../../test45/Test10/Test10.c"

/*
 * ======== pollen.reset() ========
 */

void test45_Test10_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test45_Test10_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test45_Test10_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test45_Test10_pollen__reset__E();
    test45_M_targetInit__I();
    test45_Q_targetInit__I();
    test45_Test10_targetInit__I();
    test45_Test10_pollen__ready__E();
    test45_Test10_pollen__run__E();
    test45_Test10_pollen__shutdown__E(0);
}
