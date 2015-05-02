#include <std.h>


/*
 * ======== protocol member pollen.hardware.Led.pin delegates amaret_local_A1 ========
 */

#ifndef amaret_local_A1__M
#define amaret_local_A1__M
#include "../../amaret.local/A1/A1.h"
#endif


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

#ifndef pollen_hardware_Led__M
#define pollen_hardware_Led__M
#include "../../pollen.hardware/Led/Led.h"
#endif

#ifndef test36_Blink3__M
#define test36_Blink3__M
#include "../../test36/Blink3/Blink3.h"
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
 * ======== target data definitions (unit Led) ========
 */

struct pollen_hardware_Led_ pollen_hardware_Led = { /* module data */
    &amaret_local_A1,    /* pin */
};

/*
 * ======== target data definitions (unit Blink3) ========
 */

struct test36_Blink3_ test36_Blink3 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test36_Blink3_pollen__printBool(bool b) {
}
void test36_Blink3_pollen__printInt(int32 i) {
}
void test36_Blink3_pollen__printReal(float f) {
}
void test36_Blink3_pollen__printUint(uint32 u) {
}
void test36_Blink3_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../amaret.local/Mcu/Mcu.c"
#include "../../amaret.local/A1/A1.c"
#include "../../pollen.hardware/Led/Led.c"
#include "../../test36/Blink3/Blink3.c"

/*
 * ======== pollen.ready() ========
 */

void test36_Blink3_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test36_Blink3_pollen__reset__E();
    amaret_local_Mcu_targetInit__I();
    amaret_local_A1_targetInit__I();
    pollen_hardware_Led_targetInit__I();
    test36_Blink3_targetInit__I();
    test36_Blink3_pollen__ready__E();
    test36_Blink3_pollen__run__E();
    test36_Blink3_pollen__shutdown__E(0);
}
