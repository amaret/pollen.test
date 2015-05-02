#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test37_Mod__M
#define test37_Mod__M
#include "../../test37/Mod/Mod.h"
#endif

#ifndef test37_Test__M
#define test37_Test__M
#include "../../test37/Test/Test.h"
#endif


/*
 * ======== target data definitions (unit Mod) ========
 */

struct test37_Mod_ test37_Mod = { /* module data */
};

/*
 * ======== target data definitions (unit Test) ========
 */

struct test37_Test_ test37_Test = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test37_Test_pollen__printBool(bool b) {
}
void test37_Test_pollen__printInt(int32 i) {
}
void test37_Test_pollen__printReal(float f) {
}
void test37_Test_pollen__printUint(uint32 u) {
}
void test37_Test_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test37/Mod/Mod.c"
#include "../../test37/Test/Test.c"

/*
 * ======== pollen.reset() ========
 */

void test37_Test_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test37_Test_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test37_Test_pollen__reset__E();
    test37_Mod_targetInit__I();
    test37_Test_targetInit__I();
    test37_Test_pollen__ready__E();
    test37_Test_pollen__run__E();
    test37_Test_pollen__shutdown__E(0);
}
