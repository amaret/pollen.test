#include <std.h>


/*
 * ======== protocol member test56.TestProg.pollenPrintProxy delegates test56_PrintImpl ========
 */

#ifndef test56_PrintImpl__M
#define test56_PrintImpl__M
#include "../../test56/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test56_On1__M
#define test56_On1__M
#include "../../test56/On1/On1.h"
#endif

#ifndef test56_On2__M
#define test56_On2__M
#include "../../test56/On2/On2.h"
#endif

#ifndef test56_On3__M
#define test56_On3__M
#include "../../test56/On3/On3.h"
#endif

#ifndef test56_On4__M
#define test56_On4__M
#include "../../test56/On4/On4.h"
#endif

#ifndef test56_On5__M
#define test56_On5__M
#include "../../test56/On5/On5.h"
#endif

#ifndef test56_PrintImpl__M
#define test56_PrintImpl__M
#include "../../test56/PrintImpl/PrintImpl.h"
#endif

#ifndef test56_TestProg__M
#define test56_TestProg__M
#include "../../test56/TestProg/TestProg.h"
#endif


/*
 * ======== target data definitions (unit On1) ========
 */

struct test56_On1_ test56_On1 = { /* module data */
};

/*
 * ======== target data definitions (unit On2) ========
 */

struct test56_On2_ test56_On2 = { /* module data */
};

/*
 * ======== target data definitions (unit On3) ========
 */

struct test56_On3_ test56_On3 = { /* module data */
};

/*
 * ======== target data definitions (unit On4) ========
 */

struct test56_On4_ test56_On4 = { /* module data */
};

/*
 * ======== target data definitions (unit On5) ========
 */

struct test56_On5_ test56_On5 = { /* module data */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test56_PrintImpl_ test56_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit TestProg) ========
 */

const test56_TestProg_on_host_functions__TYPE test56_TestProg_on_host_functions__A[] = {
    test56_On3_on__E,  /* [0] */
    test56_On3_on__E,  /* [1] */
    test56_On3_on__E,  /* [2] */
};

/*
 * ======== target data definitions (unit TestProg) ========
 */

struct test56_TestProg_ test56_TestProg = { /* module data */
    test56_On1_on__E,    /* on1_fref */
    test56_On1_on_0__E,    /* on1_0_fref */
    test56_On2_on__E,    /* on2_fref */
    test56_On3_on__E,    /* on3_fref */
    test56_On1_on_0__E,    /* on1_0_hfref */
    null,                    /* onP_targ_fref */
    null,                    /* onP_host_fref */
    test56_On3_on__E,    /* on3_host_fref */
    null,                    /* on1_fref_2 */
    null,                    /* on1_fref_3 */
    test56_On1_on_0__E,    /* on1_0_fref_4 */
    {
        test56_On1_on__E,  /* [0] */
        test56_On2_on__E,  /* [1] */
        test56_On3_on__E,  /* [2] */
    },    /* on_functions */
    {
        test56_On1_on__E,  /* [0] */
        test56_On2_on__E,  /* [1] */
        test56_On3_on__E,  /* [2] */
    },    /* on_functions_proto */
    {
        test56_On1_on__E,  /* [0] */
        test56_On2_on__E,  /* [1] */
        test56_On3_on__E,  /* [2] */
        test56_On4_on__E,  /* [3] */
    },    /* on_function_by_name */
    &test56_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test56_TestProg_pollen__printBool(bool b) {
    test56_PrintImpl_printBool__E(b);
}
void test56_TestProg_pollen__printInt(int32 i) {
    test56_PrintImpl_printInt__E(i);
}
void test56_TestProg_pollen__printReal(float f) {
    test56_PrintImpl_printReal__E(f);
}
void test56_TestProg_pollen__printUint(uint32 u) {
    test56_PrintImpl_printUint__E(u);
}
void test56_TestProg_pollen__printStr(string s) {
    test56_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test56/On1/On1.c"
#include "../../test56/On2/On2.c"
#include "../../test56/On3/On3.c"
#include "../../test56/On4/On4.c"
#include "../../test56/On5/On5.c"
#include "../../test56/PrintImpl/PrintImpl.c"
#include "../../test56/TestProg/TestProg.c"

/*
 * ======== pollen.reset() ========
 */

void test56_TestProg_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test56_TestProg_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test56_TestProg_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test56_TestProg_pollen__reset__E();
    test56_On1_targetInit__I();
    test56_On2_targetInit__I();
    test56_On3_targetInit__I();
    test56_On4_targetInit__I();
    test56_On5_targetInit__I();
    test56_PrintImpl_targetInit__I();
    test56_TestProg_targetInit__I();
    test56_TestProg_pollen__ready__E();
    test56_TestProg_pollen__run__E();
    test56_TestProg_pollen__shutdown__E(0);
}
