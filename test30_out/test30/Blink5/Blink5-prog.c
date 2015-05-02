#include <std.h>


/*
 * ======== protocol member test30.Led.pin delegates test30_AvrPin ========
 */

#ifndef test30_AvrPin__M
#define test30_AvrPin__M
#include "../../test30/AvrPin/AvrPin.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test30_AvrPin__M
#define test30_AvrPin__M
#include "../../test30/AvrPin/AvrPin.h"
#endif

#ifndef test30_Led__M
#define test30_Led__M
#include "../../test30/Led/Led.h"
#endif

#ifndef test30_Blink5__M
#define test30_Blink5__M
#include "../../test30/Blink5/Blink5.h"
#endif


/*
 * ======== target data definitions (unit AvrPin) ========
 */

struct test30_AvrPin_ test30_AvrPin = { /* module data */
};

/*
 * ======== target data definitions (unit Led) ========
 */

struct test30_Led_ test30_Led = { /* module data */
    &test30_AvrPin,          /* pin */
};

/*
 * ======== target data definitions (unit Blink5) ========
 */

struct test30_Blink5_ test30_Blink5 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test30_Blink5_pollen__printBool(bool b) {
}
void test30_Blink5_pollen__printInt(int32 i) {
}
void test30_Blink5_pollen__printReal(float f) {
}
void test30_Blink5_pollen__printUint(uint32 u) {
}
void test30_Blink5_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test30/AvrPin/AvrPin.c"
#include "../../test30/Led/Led.c"
#include "../../test30/Blink5/Blink5.c"

/*
 * ======== pollen.reset() ========
 */

void test30_Blink5_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test30_Blink5_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test30_Blink5_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test30_Blink5_pollen__reset__E();
    test30_AvrPin_targetInit__I();
    test30_Led_targetInit__I();
    test30_Blink5_targetInit__I();
    test30_Blink5_pollen__ready__E();
    test30_Blink5_pollen__run__E();
    test30_Blink5_pollen__shutdown__E(0);
}
