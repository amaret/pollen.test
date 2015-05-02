#include <std.h>


/*
 * ======== protocol member test100.Test.pollenPrintProxy delegates test54_PrintImpl ========
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

#ifndef test100_Test__M
#define test100_Test__M
#include "../../test100/Test/Test.h"
#endif


/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit Test) ========
 */

test100_Test_arrClsHost__TYPE test100_Test_arrClsHost__A[] = {
    /* test100.Test.Cls object init */
    {
        (uint8)0x1,              /* i */
        {
            /* test100.Test.Elem object init */
            {
                (uint32)0x2,             /* el */
            },  /* [0] */
            /* test100.Test.Elem object init */
            {
                (uint32)0x2,             /* el */
            },  /* [1] */
            /* test100.Test.Elem object init */
            {
                (uint32)0x2,             /* el */
            },  /* [2] */
        },                        /* localElemHost */
        /* test100.Test.Elem object init */
        {
            (uint32)0x3,             /* el */
        },                        /* efld */
    },  /* [0] */
    /* test100.Test.Cls object init */
    {
        (uint8)0x1,              /* i */
        {
            /* test100.Test.Elem object init */
            {
                (uint32)0x2,             /* el */
            },  /* [0] */
            /* test100.Test.Elem object init */
            {
                (uint32)0x2,             /* el */
            },  /* [1] */
            /* test100.Test.Elem object init */
            {
                (uint32)0x2,             /* el */
            },  /* [2] */
        },                        /* localElemHost */
        /* test100.Test.Elem object init */
        {
            (uint32)0x3,             /* el */
        },                        /* efld */
    },  /* [1] */
    /* test100.Test.Cls object init */
    {
        (uint8)0x1,              /* i */
        {
            /* test100.Test.Elem object init */
            {
                (uint32)0x2,             /* el */
            },  /* [0] */
            /* test100.Test.Elem object init */
            {
                (uint32)0x2,             /* el */
            },  /* [1] */
            /* test100.Test.Elem object init */
            {
                (uint32)0x2,             /* el */
            },  /* [2] */
        },                        /* localElemHost */
        /* test100.Test.Elem object init */
        {
            (uint32)0x3,             /* el */
        },                        /* efld */
    },  /* [2] */
};

/*
 * ======== target data definitions (unit Test) ========
 */

struct test100_Test_ test100_Test = { /* module data */
    null,                    /* cls */
    {
        null,  /* [0] */
        null,  /* [1] */
        null,  /* [2] */
    },    /* arrClsTarg */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test100_Test_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test100_Test_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test100_Test_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test100_Test_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test100_Test_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test100/Test/Test.c"

/*
 * ======== pollen.reset() ========
 */

void test100_Test_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test100_Test_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test100_Test_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test100_Test_pollen__reset__E();
    test54_PrintImpl_targetInit__I();
    test100_Test_targetInit__I();
    test100_Test_pollen__ready__E();
    test100_Test_pollen__run__E();
    test100_Test_pollen__shutdown__E(0);
}
