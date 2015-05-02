#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test59_InitTestM2__M
#define test59_InitTestM2__M
#include "../../test59/InitTestM2/InitTestM2.h"
#endif

#ifndef test59_InitTestM__M
#define test59_InitTestM__M
#include "../../test59/InitTestM/InitTestM.h"
#endif


/*
 * ======== target data definitions (unit InitTestM2) ========
 */

struct test59_InitTestM2_ test59_InitTestM2 = { /* module data */
};

/*
 * ======== target data definitions (unit InitTestM) ========
 */

struct test59_InitTestM_ test59_InitTestM = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test59_InitTestM_pollen__printBool(bool b) {
}
void test59_InitTestM_pollen__printInt(int32 i) {
}
void test59_InitTestM_pollen__printReal(float f) {
}
void test59_InitTestM_pollen__printUint(uint32 u) {
}
void test59_InitTestM_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test59/InitTestM2/InitTestM2.c"
#include "../../test59/InitTestM/InitTestM.c"

/*
 * ======== pollen.reset() ========
 */

void test59_InitTestM_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test59_InitTestM_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test59_InitTestM_pollen__reset__E();
    test59_InitTestM2_targetInit__I();
    test59_InitTestM_targetInit__I();
    test59_InitTestM_pollen__ready__E();
    test59_InitTestM_pollen__run__E();
    test59_InitTestM_pollen__shutdown__E(0);
}
