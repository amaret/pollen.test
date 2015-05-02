#include <std.h>


/*
 * ======== protocol member test27.Blink3.pin delegates test27_AvrPin ========
 */

#ifndef test27_AvrPin__M
#define test27_AvrPin__M
#include "../../test27/AvrPin/AvrPin.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test27_AvrPin__M
#define test27_AvrPin__M
#include "../../test27/AvrPin/AvrPin.h"
#endif

#ifndef test27_Blink3__M
#define test27_Blink3__M
#include "../../test27/Blink3/Blink3.h"
#endif


/*
 * ======== target data definitions (unit AvrPin) ========
 */

struct test27_AvrPin_ test27_AvrPin = { /* module data */
};

/*
 * ======== target data definitions (unit Blink3) ========
 */

struct test27_Blink3_ test27_Blink3 = { /* module data */
    &test27_AvrPin,          /* pin */
};

/*
 * ======== pollen print ========
 */

void test27_Blink3_pollen__printBool(bool b) {
}
void test27_Blink3_pollen__printInt(int32 i) {
}
void test27_Blink3_pollen__printReal(float f) {
}
void test27_Blink3_pollen__printUint(uint32 u) {
}
void test27_Blink3_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test27/AvrPin/AvrPin.c"
#include "../../test27/Blink3/Blink3.c"

/*
 * ======== pollen.reset() ========
 */

void test27_Blink3_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test27_Blink3_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test27_Blink3_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test27_Blink3_pollen__reset__E();
    test27_AvrPin_targetInit__I();
    test27_Blink3_targetInit__I();
    test27_Blink3_pollen__ready__E();
    test27_Blink3_pollen__run__E();
    test27_Blink3_pollen__shutdown__E(0);
}
