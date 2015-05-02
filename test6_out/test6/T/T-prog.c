#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test6_Y__M
#define test6_Y__M
#include "../../test6/Y/Y.h"
#endif

#ifndef pollen_interfaces_Gpio__M
#define pollen_interfaces_Gpio__M
#include "../../pollen.interfaces/Gpio/Gpio.h"
#endif

#ifndef test6_Led1__M
#define test6_Led1__M
#include "../../test6/Led1/Led1.h"
#endif

#ifndef test6_Led2__M
#define test6_Led2__M
#include "../../test6/Led2/Led2.h"
#endif

#ifndef test6_T__M
#define test6_T__M
#include "../../test6/T/T.h"
#endif


/*
 * ======== target data definitions (unit Y) ========
 */

struct test6_Y_ test6_Y = { /* module data */
};

/*
 * ======== target data definitions (unit Gpio) ========
 */

struct pollen_interfaces_Gpio_ pollen_interfaces_Gpio = { /* module data */
};

/*
 * ======== target data definitions (unit Led1) ========
 */

struct test6_Led1_ test6_Led1 = { /* module data */
    "Led1",                  /* pollen__unitname */
};

/*
 * ======== target data definitions (unit Led2) ========
 */

struct test6_Led2_ test6_Led2 = { /* module data */
    "Led2",                  /* pollen__unitname */
};

/*
 * ======== target data definitions (unit T) ========
 */

struct test6_T_ test6_T = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test6_T_pollen__printBool(bool b) {
}
void test6_T_pollen__printInt(int32 i) {
}
void test6_T_pollen__printReal(float f) {
}
void test6_T_pollen__printUint(uint32 u) {
}
void test6_T_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test6/Y/Y.c"
#include "../../pollen.interfaces/Gpio/Gpio.c"
#include "../../test6/Led1/Led1.c"
#include "../../test6/Led2/Led2.c"
#include "../../test6/T/T.c"

/*
 * ======== pollen.reset() ========
 */

void test6_T_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test6_T_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test6_T_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test6_T_pollen__reset__E();
    test6_Y_targetInit__I();
    pollen_interfaces_Gpio_targetInit__I();
    test6_Led1_targetInit__I();
    test6_Led2_targetInit__I();
    test6_T_targetInit__I();
    test6_T_pollen__ready__E();
    test6_T_pollen__run__E();
    test6_T_pollen__shutdown__E(0);
}
