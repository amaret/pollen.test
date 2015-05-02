#include <std.h>


/*
 * ======== protocol member test76.Test.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test76_ArrNoDim__M
#define test76_ArrNoDim__M
#include "../../test76/ArrNoDim/ArrNoDim.h"
#endif

#ifndef test76_FcnArrParm__M
#define test76_FcnArrParm__M
#include "../../test76/FcnArrParm/FcnArrParm.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test76_Test__M
#define test76_Test__M
#include "../../test76/Test/Test.h"
#endif


/*
 * ======== host data definitions (unit ArrNoDim) ========
 */

test76_ArrNoDim_arrh__TYPE test76_ArrNoDim_arrh__A[] = {
    (uint8)0x7,  /* [0] */
    (uint8)0x7,  /* [1] */
    (uint8)0x7,  /* [2] */
};

/*
 * ======== target data definitions (unit ArrNoDim) ========
 */

struct test76_ArrNoDim_ test76_ArrNoDim = { /* module data */
    null,                    /* arr */
};

/*
 * ======== host data definitions (unit FcnArrParm) ========
 */

test76_FcnArrParm_arrh__TYPE test76_FcnArrParm_arrh__A[] = {
    (uint8)0x7,  /* [0] */
    (uint8)0x7,  /* [1] */
    (uint8)0x7,  /* [2] */
};

/*
 * ======== target data definitions (unit FcnArrParm) ========
 */

struct test76_FcnArrParm_ test76_FcnArrParm = { /* module data */
    null,                    /* arr */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit Test) ========
 */

struct test76_Test_ test76_Test = { /* module data */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test76_Test_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test76_Test_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test76_Test_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test76_Test_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test76_Test_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test76/ArrNoDim/ArrNoDim.c"
#include "../../test76/FcnArrParm/FcnArrParm.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test76/Test/Test.c"

/*
 * ======== pollen.reset() ========
 */

void test76_Test_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test76_Test_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test76_Test_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test76_Test_pollen__reset__E();
    test76_ArrNoDim_targetInit__I();
    test76_FcnArrParm_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test76_Test_targetInit__I();
    test76_Test_pollen__ready__E();
    test76_Test_pollen__run__E();
    test76_Test_pollen__shutdown__E(0);
}
