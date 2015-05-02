#include <std.h>


/*
 * ======== protocol member test119.BlinkMilli.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test119_BlinkMilli__M
#define test119_BlinkMilli__M
#include "../../test119/BlinkMilli/BlinkMilli.h"
#endif


/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit BlinkMilli) ========
 */

const test119_BlinkMilli_hostarr__TYPE test119_BlinkMilli_hostarr__A[] = {
    (uint8)0x1,  /* [0] */
    (uint8)0x2,  /* [1] */
    (uint8)0x3,  /* [2] */
    (uint8)0x4,  /* [3] */
};

/*
 * ======== target data definitions (unit BlinkMilli) ========
 */

struct test119_BlinkMilli_ test119_BlinkMilli = { /* module data */
    {
        (uint8)0x1,  /* [0] */
        (uint8)0x2,  /* [1] */
        (uint8)0x3,  /* [2] */
        (uint8)0x4,  /* [3] */
    },    /* nonhostarr */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test119_BlinkMilli_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test119_BlinkMilli_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test119_BlinkMilli_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test119_BlinkMilli_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test119_BlinkMilli_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test119/BlinkMilli/BlinkMilli.c"

/*
 * ======== pollen.reset() ========
 */

void test119_BlinkMilli_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test119_BlinkMilli_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test119_BlinkMilli_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test119_BlinkMilli_pollen__reset__E();
    test54_PrintImpl_targetInit__I();
    test119_BlinkMilli_targetInit__I();
    test119_BlinkMilli_pollen__ready__E();
    test119_BlinkMilli_pollen__run__E();
    test119_BlinkMilli_pollen__shutdown__E(0);
}
