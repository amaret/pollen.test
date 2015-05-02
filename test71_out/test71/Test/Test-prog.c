#include <std.h>


/*
 * ======== protocol member test71.Test.pollenPrintProxy delegates test61_PrintImpl ========
 */

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif

#ifndef test71_Test__M
#define test71_Test__M
#include "../../test71/Test/Test.h"
#endif


/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test61_PrintImpl_ test61_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit Test) ========
 */

struct test71_Test_ test71_Test = { /* module data */
    &test61_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test71_Test_pollen__printBool(bool b) {
    test61_PrintImpl_printBool__E(b);
}
void test71_Test_pollen__printInt(int32 i) {
    test61_PrintImpl_printInt__E(i);
}
void test71_Test_pollen__printReal(float f) {
    test61_PrintImpl_printReal__E(f);
}
void test71_Test_pollen__printUint(uint32 u) {
    test61_PrintImpl_printUint__E(u);
}
void test71_Test_pollen__printStr(string s) {
    test61_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test61/PrintImpl/PrintImpl.c"
#include "../../test71/Test/Test.c"

/*
 * ======== pollen.reset() ========
 */

void test71_Test_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test71_Test_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test71_Test_pollen__reset__E();
    test61_PrintImpl_targetInit__I();
    test71_Test_targetInit__I();
    test71_Test_pollen__ready__E();
    test71_Test_pollen__run__E();
    test71_Test_pollen__shutdown__E(0);
}
