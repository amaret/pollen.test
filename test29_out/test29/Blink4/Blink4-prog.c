#include <std.h>


/*
 * ======== protocol member test29.Led.pin delegates test29_AvrPin ========
 */

#ifndef test29_AvrPin__M
#define test29_AvrPin__M
#include "../../test29/AvrPin/AvrPin.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test29_AvrPin__M
#define test29_AvrPin__M
#include "../../test29/AvrPin/AvrPin.h"
#endif

#ifndef test29_Led__M
#define test29_Led__M
#include "../../test29/Led/Led.h"
#endif

#ifndef test29_Blink4__M
#define test29_Blink4__M
#include "../../test29/Blink4/Blink4.h"
#endif


/*
 * ======== target data definitions (unit AvrPin) ========
 */

struct test29_AvrPin_ test29_AvrPin = { /* module data */
};

/*
 * ======== target data definitions (unit Led) ========
 */

struct test29_Led_ test29_Led = { /* module data */
    &test29_AvrPin,          /* pin */
};

/*
 * ======== target data definitions (unit Blink4) ========
 */

struct test29_Blink4_ test29_Blink4 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test29_Blink4_pollen__printBool(bool b) {
}
void test29_Blink4_pollen__printInt(int32 i) {
}
void test29_Blink4_pollen__printReal(float f) {
}
void test29_Blink4_pollen__printUint(uint32 u) {
}
void test29_Blink4_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test29/AvrPin/AvrPin.c"
#include "../../test29/Led/Led.c"
#include "../../test29/Blink4/Blink4.c"

/*
 * ======== pollen.reset() ========
 */

void test29_Blink4_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test29_Blink4_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test29_Blink4_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test29_Blink4_pollen__reset__E();
    test29_AvrPin_targetInit__I();
    test29_Led_targetInit__I();
    test29_Blink4_targetInit__I();
    test29_Blink4_pollen__ready__E();
    test29_Blink4_pollen__run__E();
    test29_Blink4_pollen__shutdown__E(0);
}
