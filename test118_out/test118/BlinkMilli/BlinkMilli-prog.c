#include <std.h>


/*
 * ======== protocol member test118.BlinkMilli.pollenPrintProxy delegates test54_PrintImpl ========
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

#ifndef test118_BlinkMilli__M
#define test118_BlinkMilli__M
#include "../../test118/BlinkMilli/BlinkMilli.h"
#endif


/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit BlinkMilli) ========
 */

test118_BlinkMilli_hll__TYPE test118_BlinkMilli_hll__V = /* test118.BlinkMilli.led object init */
{
    (uint8)0x1,              /* red */
    (uint8)0x9,              /* blue */
};
test118_BlinkMilli_ledArr__TYPE test118_BlinkMilli_ledArr__A[] = {
    /* test118.BlinkMilli.led object init */
    {
        (uint8)0x1,              /* red */
        (uint8)0x2,              /* blue */
    },  /* [0] */
    /* test118.BlinkMilli.led object init */
    {
        (uint8)0x1,              /* red */
        (uint8)0x2,              /* blue */
    },  /* [1] */
};
const test118_BlinkMilli_hostarr__TYPE test118_BlinkMilli_hostarr__A[] = {
    (uint8)0x0,  /* [0] */
    (uint8)0x3,  /* [1] */
    (uint8)0x3,  /* [2] */
    (uint8)0x4,  /* [3] */
};
const test118_BlinkMilli_chkarr5__TYPE test118_BlinkMilli_chkarr5__A[] = {
    (uint8)0x0,  /* [0] */
    (uint8)0x0,  /* [1] */
    (uint8)0x0,  /* [2] */
    (uint8)0x0,  /* [3] */
    (uint8)0x0,  /* [4] */
    (uint8)0x0,  /* [5] */
    (uint8)0x0,  /* [6] */
    (uint8)0x0,  /* [7] */
    (uint8)0x0,  /* [8] */
};
const test118_BlinkMilli_hostVarTest2__TYPE test118_BlinkMilli_hostVarTest2__V = (uint8)0x9;
const test118_BlinkMilli_chkarr7__TYPE test118_BlinkMilli_chkarr7__A[] = {
    (uint8)0x0,  /* [0] */
    (uint8)0x0,  /* [1] */
    (uint8)0x0,  /* [2] */
    (uint8)0x0,  /* [3] */
    (uint8)0x0,  /* [4] */
    (uint8)0x0,  /* [5] */
    (uint8)0x0,  /* [6] */
    (uint8)0x0,  /* [7] */
    (uint8)0x0,  /* [8] */
};
const test118_BlinkMilli_initialBlue__TYPE test118_BlinkMilli_initialBlue__V = (uint8)0x21;

/*
 * ======== target data definitions (unit BlinkMilli) ========
 */

struct test118_BlinkMilli_ test118_BlinkMilli = { /* module data */
    {
        (uint8)0x1,  /* [0] */
        (uint8)0x2,  /* [1] */
        (uint8)0x3,  /* [2] */
        (uint8)0x4,  /* [3] */
    },    /* nonhostarr */
    {
        null,  /* [0] */
        null,  /* [1] */
        null,  /* [2] */
    },    /* leds */
    {
        (uint8)0x1,  /* [0] */
        (uint8)0x2,  /* [1] */
        (uint8)0x3,  /* [2] */
        (uint8)0x4,  /* [3] */
    },    /* chkarr */
    null,                    /* chkarr2 */
    {
        (uint8)0x1,  /* [0] */
        (uint8)0x1,  /* [1] */
        (uint8)0x1,  /* [2] */
    },    /* chkarr3 */
    {
        (uint8)0x1,  /* [0] */
        (uint8)0x2,  /* [1] */
    },    /* chkarr4 */
    (uint8)0x9,              /* nonhostVarTest */
    {
        (uint8)0x0,  /* [0] */
        (uint8)0x0,  /* [1] */
        (uint8)0x0,  /* [2] */
        (uint8)0x0,  /* [3] */
        (uint8)0x0,  /* [4] */
        (uint8)0x0,  /* [5] */
        (uint8)0x0,  /* [6] */
        (uint8)0x0,  /* [7] */
        (uint8)0x0,  /* [8] */
    },    /* chkarr6 */
    {
        (uint8)0x0,  /* [0] */
        (uint8)0x0,  /* [1] */
        (uint8)0x0,  /* [2] */
        (uint8)0x0,  /* [3] */
        (uint8)0x0,  /* [4] */
        (uint8)0x0,  /* [5] */
        (uint8)0x0,  /* [6] */
        (uint8)0x0,  /* [7] */
        (uint8)0x0,  /* [8] */
    },    /* chkarr8 */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test118_BlinkMilli_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test118_BlinkMilli_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test118_BlinkMilli_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test118_BlinkMilli_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test118_BlinkMilli_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test118/BlinkMilli/BlinkMilli.c"

/*
 * ======== pollen.reset() ========
 */

void test118_BlinkMilli_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test118_BlinkMilli_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test118_BlinkMilli_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test118_BlinkMilli_pollen__reset__E();
    test54_PrintImpl_targetInit__I();
    test118_BlinkMilli_targetInit__E();
    test118_BlinkMilli_pollen__ready__E();
    test118_BlinkMilli_pollen__run__E();
    test118_BlinkMilli_pollen__shutdown__E(0);
}
