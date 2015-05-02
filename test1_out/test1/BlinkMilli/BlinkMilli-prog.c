#include <std.h>


/*
 * ======== protocol member test1.Cls3.gi_class delegates test1_GlobalInterrupts ========
 */

#ifndef test1_GlobalInterrupts__M
#define test1_GlobalInterrupts__M
#include "../../test1/GlobalInterrupts/GlobalInterrupts.h"
#endif


/*
 * ======== protocol member test1.BlinkMilli.gi delegates test1_GlobalInterrupts ========
 */

#ifndef test1_GlobalInterrupts__M
#define test1_GlobalInterrupts__M
#include "../../test1/GlobalInterrupts/GlobalInterrupts.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test1_Cls1__M
#define test1_Cls1__M
#include "../../test1/Cls1/Cls1.h"
#endif

#ifndef test1_GlobalInterrupts__M
#define test1_GlobalInterrupts__M
#include "../../test1/GlobalInterrupts/GlobalInterrupts.h"
#endif

#ifndef test1_SwitchTest__M
#define test1_SwitchTest__M
#include "../../test1/SwitchTest/SwitchTest.h"
#endif

#ifndef test1_Cls2__M
#define test1_Cls2__M
#include "../../test1/Cls2/Cls2.h"
#endif

#ifndef test1_Cls3__M
#define test1_Cls3__M
#include "../../test1/Cls3/Cls3.h"
#endif

#ifndef test1_ModFix__M
#define test1_ModFix__M
#include "../../test1/ModFix/ModFix.h"
#endif

#ifndef test1_MoreArrays__M
#define test1_MoreArrays__M
#include "../../test1/MoreArrays/MoreArrays.h"
#endif

#ifndef test1_ArrayAssign__M
#define test1_ArrayAssign__M
#include "../../test1/ArrayAssign/ArrayAssign.h"
#endif

#ifndef test1_ShortClassAccessInModule__M
#define test1_ShortClassAccessInModule__M
#include "../../test1/ShortClassAccessInModule/ShortClassAccessInModule.h"
#endif

#ifndef test1_BlinkMilli__M
#define test1_BlinkMilli__M
#include "../../test1/BlinkMilli/BlinkMilli.h"
#endif

test1_Cls1_blueInitialValue__TYPE test1_Cls1_blueInitialValue__V = (uint8)0x9;

/*
 * ======== host data definitions (unit GlobalInterrupts) ========
 */

const test1_GlobalInterrupts_hostVar__TYPE test1_GlobalInterrupts_hostVar__V = (uint8)0x2;

/*
 * ======== target data definitions (unit GlobalInterrupts) ========
 */

struct test1_GlobalInterrupts_ test1_GlobalInterrupts = { /* module data */
    (uint8)0x0,              /* giVar */
};

/*
 * ======== target data definitions (unit SwitchTest) ========
 */

struct test1_SwitchTest_ test1_SwitchTest = { /* module data */
};

/*
 * ======== target data definitions (unit ModFix) ========
 */

struct test1_ModFix_ test1_ModFix = { /* module data */
};

/*
 * ======== host data definitions (unit MoreArrays) ========
 */

test1_MoreArrays_lf__TYPE test1_MoreArrays_lf__V = /* test1.MoreArrays.LittleBit object init */
{
    (uint8)0x2,              /* ii */
    true,                    /* f */
};
const test1_MoreArrays_LEN__TYPE test1_MoreArrays_LEN__V = (uint8)0x3;
const test1_MoreArrays_len2__TYPE test1_MoreArrays_len2__V = (uint8)0x3;
const test1_MoreArrays_arr2__TYPE test1_MoreArrays_arr2__A[] = {
    (uint8)0x0,  /* [0] */
    (uint8)0x0,  /* [1] */
    (uint8)0x0,  /* [2] */
};

/*
 * ======== target data definitions (unit MoreArrays) ========
 */

struct test1_MoreArrays_ test1_MoreArrays = { /* module data */
    {
        (uint8)0x0,  /* [0] */
        (uint8)0x0,  /* [1] */
        (uint8)0x0,  /* [2] */
    },    /* arr */
};

/*
 * ======== target data definitions (unit ArrayAssign) ========
 */

struct test1_ArrayAssign_ test1_ArrayAssign = { /* module data */
    {
        (uint8)0x0,  /* [0] */
        (uint8)0x0,  /* [1] */
        (uint8)0x0,  /* [2] */
        (uint8)0x0,  /* [3] */
        (uint8)0x0,  /* [4] */
    },    /* buffer */
};

/*
 * ======== target data definitions (unit ShortClassAccessInModule) ========
 */

struct test1_ShortClassAccessInModule_ test1_ShortClassAccessInModule = { /* module data */
};

/*
 * ======== host data definitions (unit BlinkMilli) ========
 */

const test1_BlinkMilli_myVar__TYPE test1_BlinkMilli_myVar__V = (uint8)0x3;
const test1_BlinkMilli_myVarArr__TYPE test1_BlinkMilli_myVarArr__A[] = {
    (uint8)0x7,  /* [0] */
    (uint8)0x7,  /* [1] */
    (uint8)0x3,  /* [2] */
};
test1_BlinkMilli_hll__TYPE test1_BlinkMilli_hll__V = /* test1.BlinkMilli.led object init */
{
    (uint8)0x1,              /* red */
    (uint8)0x0,              /* green */
    (uint8)0x9,              /* blue */
};
test1_BlinkMilli_testNest__TYPE test1_BlinkMilli_testNest__V = /* test1.Cls3 object init */
{
    &test1_GlobalInterrupts,    /* gi_class */
    /* test1.Cls3.Cls4 object init */
    {
        (uint8)0x3,              /* i */
        null,                    /* gi_class_nest */
    },                        /* c1 */
    /* test1.Cls2 object init */
    {
        (uint32)0x3,             /* us */
        (uint32)0x64,            /* ticksPerUs */
    },                        /* c2 */
};
test1_BlinkMilli_testcls2__TYPE test1_BlinkMilli_testcls2__V = /* test1.Cls2 object init */
{
    (uint32)0x3,             /* us */
    (uint32)0x64,            /* ticksPerUs */
};
test1_BlinkMilli_ledArr__TYPE test1_BlinkMilli_ledArr__A[] = {
    /* test1.BlinkMilli.led object init */
    {
        (uint8)0x1,              /* red */
        (uint8)0x0,              /* green */
        (uint8)0x2,              /* blue */
    },  /* [0] */
    /* test1.BlinkMilli.led object init */
    {
        (uint8)0x1,              /* red */
        (uint8)0x0,              /* green */
        (uint8)0x2,              /* blue */
    },  /* [1] */
};
const test1_BlinkMilli_hostarr__TYPE test1_BlinkMilli_hostarr__A[] = {
    (uint8)0x0,  /* [0] */
    (uint8)0x3,  /* [1] */
    (uint8)0x3,  /* [2] */
    (uint8)0x4,  /* [3] */
};
const test1_BlinkMilli_hostarr2d__TYPE test1_BlinkMilli_hostarr2d__A[][] = {
    (uint8)0x0,  /* [0] */
    (uint8)0x0,  /* [1] */
    (uint8)0x0,  /* [2] */
    (uint8)0x0,  /* [3] */
    (uint8)0x0,  /* [4] */
    (uint8)0x0,  /* [5] */
    (uint8)0x0,  /* [6] */
    (uint8)0x0,  /* [7] */
};
const test1_BlinkMilli_chkarr5__TYPE test1_BlinkMilli_chkarr5__A[] = {
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
const test1_BlinkMilli_hostVarTest2__TYPE test1_BlinkMilli_hostVarTest2__V = (uint8)0x9;
const test1_BlinkMilli_chkarr7__TYPE test1_BlinkMilli_chkarr7__A[] = {
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
const test1_BlinkMilli_hostVarNotRefdInTarget__TYPE test1_BlinkMilli_hostVarNotRefdInTarget__V = (uint8)0x3;
const test1_BlinkMilli_initialBlue__TYPE test1_BlinkMilli_initialBlue__V = (uint8)0x21;
test1_BlinkMilli_ccc__TYPE test1_BlinkMilli_ccc__V = /* test1.Cls1 object init */
{
    (uint8)0x1,              /* red */
    (uint8)0x0,              /* green */
    (uint8)0x9,              /* blue */
    (uint8)0x9,              /* blueInitialValue */
};

/*
 * ======== target data definitions (unit BlinkMilli) ========
 */

struct test1_BlinkMilli_ test1_BlinkMilli = { /* module data */
    null,                    /* tll */
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
    },    /* nonhostarr */
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
    &test1_GlobalInterrupts,    /* gi */
    (uint8)0x4,              /* nonhostVarTest */
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
    (uint8)0x4,              /* hostVarRefdInTarget */
    "yy",                    /* thing */
};

/*
 * ======== pollen print ========
 */

void test1_BlinkMilli_pollen__printBool(bool b) {
}
void test1_BlinkMilli_pollen__printInt(int32 i) {
}
void test1_BlinkMilli_pollen__printReal(float f) {
}
void test1_BlinkMilli_pollen__printUint(uint32 u) {
}
void test1_BlinkMilli_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test1/Cls1/Cls1.c"
#include "../../test1/GlobalInterrupts/GlobalInterrupts.c"
#include "../../test1/SwitchTest/SwitchTest.c"
#include "../../test1/Cls2/Cls2.c"
#include "../../test1/Cls3/Cls3.c"
#include "../../test1/ModFix/ModFix.c"
#include "../../test1/MoreArrays/MoreArrays.c"
#include "../../test1/ArrayAssign/ArrayAssign.c"
#include "../../test1/ShortClassAccessInModule/ShortClassAccessInModule.c"
#include "../../test1/BlinkMilli/BlinkMilli.c"

/*
 * ======== pollen.reset() ========
 */

void test1_BlinkMilli_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test1_BlinkMilli_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test1_BlinkMilli_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test1_BlinkMilli_pollen__reset__E();
    test1_GlobalInterrupts_targetInit__I();
    test1_SwitchTest_targetInit__I();
    test1_ModFix_targetInit__I();
    test1_MoreArrays_targetInit__I();
    test1_ArrayAssign_targetInit__I();
    test1_ShortClassAccessInModule_targetInit__I();
    test1_BlinkMilli_targetInit__E();
    test1_BlinkMilli_pollen__ready__E();
    test1_ArrayAssign_pollen__run__E();
    test1_BlinkMilli_pollen__shutdown__E(0);
}
