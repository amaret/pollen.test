#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef pollen_data_Qint8__M
#define pollen_data_Qint8__M
#include "../../pollen.data/Qint8/Qint8.h"
#endif

#ifndef test46_Test1__M
#define test46_Test1__M
#include "../../test46/Test1/Test1.h"
#endif


/*
 * ======== host data definitions (unit Test1) ========
 */

test46_Test1_myQ__TYPE test46_Test1_myQ__V = /* pollen.data.Qint8 object init */
{
    (uint8)0x0,              /* capacity */
        0  /* empty */
,    /* elements */
    (uint8)0x0,              /* length */
    (uint8)0x0,              /* head */
    (uint8)0x0,              /* tail */
};

/*
 * ======== target data definitions (unit Test1) ========
 */

struct test46_Test1_ test46_Test1 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test46_Test1_pollen__printBool(bool b) {
}
void test46_Test1_pollen__printInt(int32 i) {
}
void test46_Test1_pollen__printReal(float f) {
}
void test46_Test1_pollen__printUint(uint32 u) {
}
void test46_Test1_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../pollen.data/Qint8/Qint8.c"
#include "../../test46/Test1/Test1.c"

/*
 * ======== pollen.reset() ========
 */

void test46_Test1_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test46_Test1_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test46_Test1_pollen__reset__E();
    test46_Test1_targetInit__I();
    test46_Test1_pollen__ready__E();
    test46_Test1_pollen__run__E();
    test46_Test1_pollen__shutdown__E(0);
}
