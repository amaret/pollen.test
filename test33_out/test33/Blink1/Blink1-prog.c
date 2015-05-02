#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef amaret_local_Mcu__M
#define amaret_local_Mcu__M
#include "../../amaret.local/Mcu/Mcu.h"
#endif

#ifndef amaret_local_A1__M
#define amaret_local_A1__M
#include "../../amaret.local/A1/A1.h"
#endif

#ifndef test33_Blink1__M
#define test33_Blink1__M
#include "../../test33/Blink1/Blink1.h"
#endif


/*
 * ======== target data definitions (unit Mcu) ========
 */

struct amaret_local_Mcu_ amaret_local_Mcu = { /* module data */
    (uint32)0x0,             /* sysFreq */
};

/*
 * ======== target data definitions (unit A1) ========
 */

struct amaret_local_A1_ amaret_local_A1 = { /* module data */
};

/*
 * ======== target data definitions (unit Blink1) ========
 */

struct test33_Blink1_ test33_Blink1 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test33_Blink1_pollen__printBool(bool b) {
}
void test33_Blink1_pollen__printInt(int32 i) {
}
void test33_Blink1_pollen__printReal(float f) {
}
void test33_Blink1_pollen__printUint(uint32 u) {
}
void test33_Blink1_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../amaret.local/Mcu/Mcu.c"
#include "../../amaret.local/A1/A1.c"
#include "../../test33/Blink1/Blink1.c"

/*
 * ======== pollen.ready() ========
 */

void test33_Blink1_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test33_Blink1_pollen__reset__E();
    amaret_local_Mcu_targetInit__I();
    amaret_local_A1_targetInit__I();
    test33_Blink1_targetInit__I();
    test33_Blink1_pollen__ready__E();
    test33_Blink1_pollen__run__E();
    test33_Blink1_pollen__shutdown__E(0);
}
