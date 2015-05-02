#include <std.h>


/*
 * ======== protocol member test95.Test.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test95_ArrMod__M
#define test95_ArrMod__M
#include "../../test95/ArrMod/ArrMod.h"
#endif

#ifndef test95_Arr__M
#define test95_Arr__M
#include "../../test95/Arr/Arr.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test95_Test__M
#define test95_Test__M
#include "../../test95/Test/Test.h"
#endif


/*
 * ======== host data definitions (unit ArrMod) ========
 */

const test95_ArrMod_sizeHost__TYPE test95_ArrMod_sizeHost__V = (uint8)0x8;
const test95_ArrMod_hostBuff_sizeHost__TYPE test95_ArrMod_hostBuff_sizeHost__A[] = {
    (uint8)0x0,  /* [0] */
    (uint8)0x0,  /* [1] */
    (uint8)0x0,  /* [2] */
    (uint8)0x0,  /* [3] */
    (uint8)0x0,  /* [4] */
    (uint8)0x0,  /* [5] */
    (uint8)0x0,  /* [6] */
    (uint8)0x0,  /* [7] */
};
const test95_ArrMod_hostBuff_noSize__TYPE test95_ArrMod_hostBuff_noSize__A[] = {
    (uint8)0x1,  /* [0] */
    (uint8)0x2,  /* [1] */
    (uint8)0x3,  /* [2] */
};
const test95_ArrMod_hostBuff_sizeTarg__TYPE test95_ArrMod_hostBuff_sizeTarg__A[] = {
    (uint8)0x0,  /* [0] */
    (uint8)0x0,  /* [1] */
    (uint8)0x0,  /* [2] */
    (uint8)0x0,  /* [3] */
    (uint8)0x0,  /* [4] */
    (uint8)0x0,  /* [5] */
};
const test95_ArrMod_hostBuff_sizeConst__TYPE test95_ArrMod_hostBuff_sizeConst__A[] = {
    (uint8)0x0,  /* [0] */
    (uint8)0x1,  /* [1] */
    (uint8)0x2,  /* [2] */
    (uint8)0x3,  /* [3] */
    (uint8)0x4,  /* [4] */
    (uint8)0x0,  /* [5] */
    (uint8)0x0,  /* [6] */
};
const test95_ArrMod_hostBuff_sizeConst2__TYPE test95_ArrMod_hostBuff_sizeConst2__A[] = {
    (uint8)0x3,  /* [0] */
    (uint8)0x3,  /* [1] */
    (uint8)0x3,  /* [2] */
    (uint8)0x3,  /* [3] */
    (uint8)0x3,  /* [4] */
    (uint8)0x3,  /* [5] */
    (uint8)0x3,  /* [6] */
};

/*
 * ======== target data definitions (unit ArrMod) ========
 */

struct test95_ArrMod_ test95_ArrMod = { /* module data */
    (uint8)0x6,              /* sizeTarg */
    {
        (uint8)0x0,  /* [0] */
        (uint8)0x0,  /* [1] */
        (uint8)0x0,  /* [2] */
        (uint8)0x0,  /* [3] */
        (uint8)0x0,  /* [4] */
        (uint8)0x0,  /* [5] */
        (uint8)0x0,  /* [6] */
        (uint8)0x0,  /* [7] */
    },    /* targBuff_sizeHost */
    {
        (uint8)0x1,  /* [0] */
        (uint8)0x2,  /* [1] */
        (uint8)0x3,  /* [2] */
    },    /* targBuff_nosize */
    {
        (uint8)0x0,  /* [0] */
        (uint8)0x0,  /* [1] */
        (uint8)0x0,  /* [2] */
        (uint8)0x0,  /* [3] */
        (uint8)0x0,  /* [4] */
        (uint8)0x0,  /* [5] */
    },    /* targBuff_sizeTarg */
};

/*
 * ======== host data definitions (unit Arr) ========
 */

test95_Arr_clsVar__TYPE test95_Arr_clsVar__V = /* test95.Arr.Cls object init */
{
    (uint8)0x3,              /* clsV */
};
const test95_Arr_sizeHost__TYPE test95_Arr_sizeHost__V = (uint8)0x8;
test95_Arr_hostBuff_clsObj__TYPE test95_Arr_hostBuff_clsObj__A[] = {
    /* test95.Arr.Cls object init */
    {
        (uint8)0x2,              /* clsV */
    },  /* [0] */
    /* test95.Arr.Cls object init */
    {
        (uint8)0x4,              /* clsV */
    },  /* [1] */
};

/*
 * ======== target data definitions (unit Arr) ========
 */

struct test95_Arr_ test95_Arr = { /* module data */
    {
        (uint8)0x1,  /* [0] */
        (uint8)0x1,  /* [1] */
        (uint8)0x1,  /* [2] */
        (uint8)0x1,  /* [3] */
        (uint8)0x1,  /* [4] */
        (uint8)0x1,  /* [5] */
        (uint8)0x1,  /* [6] */
        (uint8)0x1,  /* [7] */
    },    /* targBuff_sizeHost */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit Test) ========
 */

test95_Test_host_cls__TYPE test95_Test_host_cls__V = /* test95.Arr.Cls object init */
{
    (uint8)0x8,              /* clsV */
};
const test95_Test_Test_i__TYPE test95_Test_Test_i__V = (uint32)1.3333333333333333;

/*
 * ======== target data definitions (unit Test) ========
 */

struct test95_Test_ test95_Test = { /* module data */
    null,                    /* cls */
    {
        (uint8)0x0,  /* [0] */
        (uint8)0x0,  /* [1] */
        (uint8)0x0,  /* [2] */
        (uint8)0x0,  /* [3] */
        (uint8)0x0,  /* [4] */
        (uint8)0x0,  /* [5] */
        (uint8)0x0,  /* [6] */
        (uint8)0x0,  /* [7] */
    },    /* arr */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test95_Test_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test95_Test_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test95_Test_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test95_Test_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test95_Test_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test95/ArrMod/ArrMod.c"
#include "../../test95/Arr/Arr.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test95/Test/Test.c"

/*
 * ======== pollen.reset() ========
 */

void test95_Test_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test95_Test_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test95_Test_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test95_Test_pollen__reset__E();
    test95_ArrMod_targetInit__I();
    test95_Arr_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test95_Test_targetInit__I();
    test95_Test_pollen__ready__E();
    test95_Test_pollen__run__E();
    test95_Test_pollen__shutdown__E(0);
}
