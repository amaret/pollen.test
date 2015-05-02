#include <std.h>


/*
 * ======== protocol member test61.Led.pin delegates test61_AvrPin ========
 */

#ifndef test61_AvrPin__M
#define test61_AvrPin__M
#include "../../test61/AvrPin/AvrPin.h"
#endif


/*
 * ======== protocol member test61.Blink.pollenPrintProxy delegates test61_PrintImpl ========
 */

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test61_AvrPin__M
#define test61_AvrPin__M
#include "../../test61/AvrPin/AvrPin.h"
#endif

#ifndef test61_Led__M
#define test61_Led__M
#include "../../test61/Led/Led.h"
#endif

#ifndef test61_PrintImpl__M
#define test61_PrintImpl__M
#include "../../test61/PrintImpl/PrintImpl.h"
#endif

#ifndef test61_Blink__M
#define test61_Blink__M
#include "../../test61/Blink/Blink.h"
#endif


/*
 * ======== target data definitions (unit AvrPin) ========
 */

struct test61_AvrPin_ test61_AvrPin = { /* module data */
    (uint32)0x0,             /* PORTB */
    (uint32)0x0,             /* DDRB */
};

/*
 * ======== target data definitions (unit Led) ========
 */

struct test61_Led_ test61_Led = { /* module data */
    &test61_AvrPin,          /* pin */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test61_PrintImpl_ test61_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit Blink) ========
 */

struct test61_Blink_ test61_Blink = { /* module data */
    &test61_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test61_Blink_pollen__printBool(bool b) {
    test61_PrintImpl_printBool__E(b);
}
void test61_Blink_pollen__printInt(int32 i) {
    test61_PrintImpl_printInt__E(i);
}
void test61_Blink_pollen__printReal(float f) {
    test61_PrintImpl_printReal__E(f);
}
void test61_Blink_pollen__printUint(uint32 u) {
    test61_PrintImpl_printUint__E(u);
}
void test61_Blink_pollen__printStr(string s) {
    test61_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test61/AvrPin/AvrPin.c"
#include "../../test61/Led/Led.c"
#include "../../test61/PrintImpl/PrintImpl.c"
#include "../../test61/Blink/Blink.c"

/*
 * ======== pollen.reset() ========
 */

void test61_Blink_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test61_Blink_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test61_Blink_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test61_Blink_pollen__reset__E();
    test61_AvrPin_targetInit__I();
    test61_Led_targetInit__I();
    test61_PrintImpl_targetInit__I();
    test61_Blink_targetInit__I();
    test61_Blink_pollen__ready__E();
    test61_Blink_pollen__run__E();
    test61_Blink_pollen__shutdown__E(0);
}
