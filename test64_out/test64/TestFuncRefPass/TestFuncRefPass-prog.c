#include <std.h>


/*
 * ======== protocol member test64.TestFuncRefPass.pollenPrintProxy delegates test61_PrintImpl ========
 */

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test64_FuncRefClass__M
#define test64_FuncRefClass__M
#include "../../test64/FuncRefClass/FuncRefClass.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif

#ifndef test64_TestFuncRefPass__M
#define test64_TestFuncRefPass__M
#include "../../test64/TestFuncRefPass/TestFuncRefPass.h"
#endif


/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test61_PrintImpl_ test61_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit TestFuncRefPass) ========
 */

test64_TestFuncRefPass_f__TYPE test64_TestFuncRefPass_f__V = /* test64.FuncRefClass object init */
{
    test64_TestFuncRefPass_foo__I,    /* myHandler */
};

/*
 * ======== target data definitions (unit TestFuncRefPass) ========
 */

struct test64_TestFuncRefPass_ test64_TestFuncRefPass = { /* module data */
    null,                    /* myHandler */
    &test61_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test64_TestFuncRefPass_pollen__printBool(bool b) {
    test61_PrintImpl_printBool__E(b);
}
void test64_TestFuncRefPass_pollen__printInt(int32 i) {
    test61_PrintImpl_printInt__E(i);
}
void test64_TestFuncRefPass_pollen__printReal(float f) {
    test61_PrintImpl_printReal__E(f);
}
void test64_TestFuncRefPass_pollen__printUint(uint32 u) {
    test61_PrintImpl_printUint__E(u);
}
void test64_TestFuncRefPass_pollen__printStr(string s) {
    test61_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test64/FuncRefClass/FuncRefClass.c"
#include "../../test61/PrintImpl/PrintImpl.c"
#include "../../test64/TestFuncRefPass/TestFuncRefPass.c"

/*
 * ======== pollen.reset() ========
 */

void test64_TestFuncRefPass_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test64_TestFuncRefPass_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test64_TestFuncRefPass_pollen__reset__E();
    test61_PrintImpl_targetInit__I();
    test64_TestFuncRefPass_targetInit__I();
    test64_TestFuncRefPass_pollen__ready__E();
    test64_TestFuncRefPass_pollen__run__E();
    test64_TestFuncRefPass_pollen__shutdown__E(0);
}
