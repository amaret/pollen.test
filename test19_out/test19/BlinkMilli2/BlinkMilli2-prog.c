#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef pollen_interfaces_Led__M
#define pollen_interfaces_Led__M
#include "../../pollen.interfaces/Led/Led.h"
#endif

#ifndef cc_arduino_PrintImpl__M
#define cc_arduino_PrintImpl__M
#include "../../cc.arduino/PrintImpl/PrintImpl.h"
#endif

#ifndef test19_Y__M
#define test19_Y__M
#include "../../test19/Y/Y.h"
#endif

#ifndef test19_TT__M
#define test19_TT__M
#include "../../test19/TT/TT.h"
#endif

#ifndef test19_BlinkMilli2__M
#define test19_BlinkMilli2__M
#include "../../test19/BlinkMilli2/BlinkMilli2.h"
#endif


/*
 * ======== target data definitions (unit Led) ========
 */

struct pollen_interfaces_Led_ pollen_interfaces_Led = { /* module data */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct cc_arduino_PrintImpl_ cc_arduino_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit Y) ========
 */

struct test19_Y_ test19_Y = { /* module data */
};

/*
 * ======== target data definitions (unit TT) ========
 */

struct test19_TT_ test19_TT = { /* module data */
};

/*
 * ======== target data definitions (unit BlinkMilli2) ========
 */

struct test19_BlinkMilli2_ test19_BlinkMilli2 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test19_BlinkMilli2_pollen__printBool(bool b) {
    cc_arduino_PrintImpl_printBool__E(b);
}
void test19_BlinkMilli2_pollen__printInt(int32 i) {
    cc_arduino_PrintImpl_printInt__E(i);
}
void test19_BlinkMilli2_pollen__printReal(float f) {
    cc_arduino_PrintImpl_printReal__E(f);
}
void test19_BlinkMilli2_pollen__printUint(uint32 u) {
    cc_arduino_PrintImpl_printUint__E(u);
}
void test19_BlinkMilli2_pollen__printStr(string s) {
    cc_arduino_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../pollen.interfaces/Led/Led.c"
#include "../../cc.arduino/PrintImpl/PrintImpl.c"
#include "../../test19/Y/Y.c"
#include "../../test19/TT/TT.c"
#include "../../test19/BlinkMilli2/BlinkMilli2.c"

/*
 * ======== pollen.ready() ========
 */

void test19_BlinkMilli2_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test19_BlinkMilli2_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test19_BlinkMilli2_pollen__reset__E();
    pollen_interfaces_Led_targetInit__I();
    cc_arduino_PrintImpl_targetInit__I();
    test19_Y_targetInit__I();
    test19_TT_targetInit__I();
    test19_BlinkMilli2_targetInit__I();
    test19_BlinkMilli2_pollen__ready__E();
    test19_BlinkMilli2_pollen__run__E();
    test19_BlinkMilli2_pollen__shutdown__E(0);
}
