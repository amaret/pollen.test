#include <std.h>


/*
 * ======== protocol member test116.ArrayInitBug.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test116_C1__M
#define test116_C1__M
#include "../../test116/C1/C1.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test116_ArrayInitBug__M
#define test116_ArrayInitBug__M
#include "../../test116/ArrayInitBug/ArrayInitBug.h"
#endif


/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit ArrayInitBug) ========
 */

test116_ArrayInitBug_array__TYPE test116_ArrayInitBug_array__A[] = {
    /* test116.C1 object init */
    {
        (uint8)0x1,              /* c */
    },  /* [0] */
    /* test116.C1 object init */
    {
        (uint8)0x1,              /* c */
    },  /* [1] */
    /* test116.C1 object init */
    {
        (uint8)0x1,              /* c */
    },  /* [2] */
    /* test116.C1 object init */
    {
        (uint8)0x1,              /* c */
    },  /* [3] */
    /* test116.C1 object init */
    {
        (uint8)0x1,              /* c */
    },  /* [4] */
};

/*
 * ======== target data definitions (unit ArrayInitBug) ========
 */

struct test116_ArrayInitBug_ test116_ArrayInitBug = { /* module data */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test116_ArrayInitBug_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test116_ArrayInitBug_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test116_ArrayInitBug_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test116_ArrayInitBug_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test116_ArrayInitBug_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test116/C1/C1.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test116/ArrayInitBug/ArrayInitBug.c"

/*
 * ======== pollen.reset() ========
 */

void test116_ArrayInitBug_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test116_ArrayInitBug_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test116_ArrayInitBug_pollen__reset__E();
    test54_PrintImpl_targetInit__I();
    test116_ArrayInitBug_targetInit__I();
    test116_ArrayInitBug_pollen__ready__E();
    test116_ArrayInitBug_pollen__run__E();
    test116_ArrayInitBug_pollen__shutdown__E(0);
}
