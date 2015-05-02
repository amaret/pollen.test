#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef atmel_atmega328_Mcu__M
#define atmel_atmega328_Mcu__M
#include "../../atmel.atmega328/Mcu/Mcu.h"
#endif

#ifndef atmel_atmega328_PB5__M
#define atmel_atmega328_PB5__M
#include "../../atmel.atmega328/PB5/PB5.h"
#endif

#ifndef cc_arduino_Lifecycle__M
#define cc_arduino_Lifecycle__M
#include "../../cc.arduino/Lifecycle/Lifecycle.h"
#endif

#ifndef test25_BlinkUno1__M
#define test25_BlinkUno1__M
#include "../../test25/BlinkUno1/BlinkUno1.h"
#endif


/*
 * ======== target data definitions (unit Mcu) ========
 */

struct atmel_atmega328_Mcu_ atmel_atmega328_Mcu = { /* module data */
    (uint32)0x0,             /* sysFreq */
};

/*
 * ======== target data definitions (unit PB5) ========
 */

struct atmel_atmega328_PB5_ atmel_atmega328_PB5 = { /* module data */
};

/*
 * ======== target data definitions (unit Lifecycle) ========
 */

struct cc_arduino_Lifecycle_ cc_arduino_Lifecycle = { /* module data */
};

/*
 * ======== target data definitions (unit BlinkUno1) ========
 */

struct test25_BlinkUno1_ test25_BlinkUno1 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test25_BlinkUno1_pollen__printBool(bool b) {
}
void test25_BlinkUno1_pollen__printInt(int32 i) {
}
void test25_BlinkUno1_pollen__printReal(float f) {
}
void test25_BlinkUno1_pollen__printUint(uint32 u) {
}
void test25_BlinkUno1_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../atmel.atmega328/Mcu/Mcu.c"
#include "../../atmel.atmega328/PB5/PB5.c"
#include "../../cc.arduino/Lifecycle/Lifecycle.c"
#include "../../test25/BlinkUno1/BlinkUno1.c"

/*
 * ======== main() ========
 */

int main() {
    cc_arduino_Lifecycle_pollen__reset__E();
    atmel_atmega328_Mcu_targetInit__I();
    atmel_atmega328_PB5_targetInit__I();
    cc_arduino_Lifecycle_targetInit__I();
    test25_BlinkUno1_targetInit__I();
    cc_arduino_Lifecycle_pollen__ready__E();
    test25_BlinkUno1_pollen__run__E();
    cc_arduino_Lifecycle_pollen__shutdown__E(0);
}
