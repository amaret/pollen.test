#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test7_Y__M
#define test7_Y__M
#include "../../test7/Y/Y.h"
#endif

#ifndef pollen_interfaces_Gpio__M
#define pollen_interfaces_Gpio__M
#include "../../pollen.interfaces/Gpio/Gpio.h"
#endif

#ifndef test7_Led__M
#define test7_Led__M
#include "../../test7/Led/Led.h"
#endif

#ifndef test7_T__M
#define test7_T__M
#include "../../test7/T/T.h"
#endif


/*
 * ======== target data definitions (unit Y) ========
 */

struct test7_Y_ test7_Y = { /* module data */
};

/*
 * ======== target data definitions (unit Gpio) ========
 */

struct pollen_interfaces_Gpio_ pollen_interfaces_Gpio = { /* module data */
};

/*
 * ======== target data definitions (unit Led) ========
 */

struct test7_Led_ test7_Led = { /* module data */
};

/*
 * ======== target data definitions (unit T) ========
 */

struct test7_T_ test7_T = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test7_T_pollen__printBool(bool b) {
}
void test7_T_pollen__printInt(int32 i) {
}
void test7_T_pollen__printReal(float f) {
}
void test7_T_pollen__printUint(uint32 u) {
}
void test7_T_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test7/Y/Y.c"
#include "../../pollen.interfaces/Gpio/Gpio.c"
#include "../../test7/Led/Led.c"
#include "../../test7/T/T.c"

/*
 * ======== pollen.reset() ========
 */

void test7_T_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test7_T_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test7_T_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test7_T_pollen__reset__E();
    test7_Y_targetInit__I();
    pollen_interfaces_Gpio_targetInit__I();
    test7_Led_targetInit__I();
    test7_T_targetInit__I();
    test7_T_pollen__ready__E();
    test7_T_pollen__run__E();
    test7_T_pollen__shutdown__E(0);
}
