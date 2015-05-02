#include <std.h>


/*
 * ======== protocol member test66.Test_08.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef pollen_data_HandlerQueue__M
#define pollen_data_HandlerQueue__M
#include "../../pollen.data/HandlerQueue/HandlerQueue.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test66_Test_08__M
#define test66_Test_08__M
#include "../../test66/Test_08/Test_08.h"
#endif


/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit Test_08) ========
 */

test66_Test_08_handlers__TYPE test66_Test_08_handlers__V = /* pollen.data.HandlerQueue object init */
{
    (const uint8)0xa,    /* capacity */
    {
        null,  /* [0] */
        null,  /* [1] */
        null,  /* [2] */
        null,  /* [3] */
        null,  /* [4] */
        null,  /* [5] */
        null,  /* [6] */
        null,  /* [7] */
        null,  /* [8] */
        null,  /* [9] */
    },    /* elements */
    (uint8)0x0,              /* length */
    (uint8)0x0,              /* head */
    (uint8)0x0,              /* tail */
    (uint8)0x5,              /* maxLength */
};

/*
 * ======== target data definitions (unit Test_08) ========
 */

struct test66_Test_08_ test66_Test_08 = { /* module data */
    null,                    /* h */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test66_Test_08_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test66_Test_08_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test66_Test_08_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test66_Test_08_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test66_Test_08_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../pollen.data/HandlerQueue/HandlerQueue.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test66/Test_08/Test_08.c"

/*
 * ======== pollen.reset() ========
 */

void test66_Test_08_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test66_Test_08_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test66_Test_08_pollen__reset__E();
    test54_PrintImpl_targetInit__I();
    test66_Test_08_targetInit__I();
    test66_Test_08_pollen__ready__E();
    test66_Test_08_pollen__run__E();
    test66_Test_08_pollen__shutdown__E(0);
}
