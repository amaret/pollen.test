#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test57_ClsFuncRef__M
#define test57_ClsFuncRef__M
#include "../../test57/ClsFuncRef/ClsFuncRef.h"
#endif

#ifndef test57_SetFuncRefOnHost__M
#define test57_SetFuncRefOnHost__M
#include "../../test57/SetFuncRefOnHost/SetFuncRefOnHost.h"
#endif


/*
 * ======== host data definitions (unit SetFuncRefOnHost) ========
 */

test57_SetFuncRefOnHost_clsFR__TYPE test57_SetFuncRefOnHost_clsFR__V = /* test57.ClsFuncRef object init */
{
    null,                    /* myHandler1_Host */
    null,                    /* myHandler2_Host */
    null,                    /* myHandler3_Host */
    null,                    /* myHandler4_Host */
    true,                    /* flag */
    null,                    /* myHandler1_Targ */
    null,                    /* myHandler2_Targ */
    null,                    /* myHandler3_Targ */
    null,                    /* myHandler4_Targ */
    true,                    /* flag2 */
    null,                    /* tt */
};

/*
 * ======== target data definitions (unit SetFuncRefOnHost) ========
 */

struct test57_SetFuncRefOnHost_ test57_SetFuncRefOnHost = { /* module data */
    null,                    /* myHandler1_Host */
    test57_SetFuncRefOnHost_targetTheHandler__I,    /* myHandler2_Host */
    null,                    /* myHandler3_Host */
    null,                    /* myHandler4_Host */
    true,                    /* flag */
    null,                    /* myHandler1_Targ */
    null,                    /* myHandler2_Targ */
    null,                    /* myHandler3_Targ */
    test57_SetFuncRefOnHost_targetTheHandler__I,    /* myHandler4_Targ */
    true,                    /* flag2 */
};

/*
 * ======== pollen print ========
 */

void test57_SetFuncRefOnHost_pollen__printBool(bool b) {
}
void test57_SetFuncRefOnHost_pollen__printInt(int32 i) {
}
void test57_SetFuncRefOnHost_pollen__printReal(float f) {
}
void test57_SetFuncRefOnHost_pollen__printUint(uint32 u) {
}
void test57_SetFuncRefOnHost_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test57/ClsFuncRef/ClsFuncRef.c"
#include "../../test57/SetFuncRefOnHost/SetFuncRefOnHost.c"

/*
 * ======== pollen.reset() ========
 */

void test57_SetFuncRefOnHost_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test57_SetFuncRefOnHost_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test57_SetFuncRefOnHost_pollen__reset__E();
    test57_SetFuncRefOnHost_targetInit__I();
    test57_SetFuncRefOnHost_pollen__ready__E();
    test57_SetFuncRefOnHost_pollen__run__E();
    test57_SetFuncRefOnHost_pollen__shutdown__E(0);
}
