#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef test35_Timer0MatchA__M
#define test35_Timer0MatchA__M
#include "../../test35/Timer0MatchA/Timer0MatchA.h"
#endif

#ifndef test35_ATmega328__M
#define test35_ATmega328__M
#include "../../test35/ATmega328/ATmega328.h"
#endif


/*
 * ======== target data definitions (unit Timer0MatchA) ========
 */

struct test35_Timer0MatchA_ test35_Timer0MatchA = { /* module data */
    null,                    /* handler */
};

/*
 * ======== target data definitions (unit ATmega328) ========
 */

struct test35_ATmega328_ test35_ATmega328 = { /* module data */
};

/*
 * ======== pollen print ========
 */

void test35_ATmega328_pollen__printBool(bool b) {
}
void test35_ATmega328_pollen__printInt(int32 i) {
}
void test35_ATmega328_pollen__printReal(float f) {
}
void test35_ATmega328_pollen__printUint(uint32 u) {
}
void test35_ATmega328_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../test35/Timer0MatchA/Timer0MatchA.c"
#include "../../test35/ATmega328/ATmega328.c"

/*
 * ======== pollen.reset() ========
 */

void test35_ATmega328_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test35_ATmega328_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test35_ATmega328_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test35_ATmega328_pollen__reset__E();
    test35_Timer0MatchA_targetInit__I();
    test35_ATmega328_targetInit__I();
    test35_ATmega328_pollen__ready__E();
    test35_ATmega328_pollen__run__E();
    test35_ATmega328_pollen__shutdown__E(0);
}
