#include <std.h>


/*
 * ======== protocol member test69.Test_12.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef virtual_mcu_ConsolePrint__M
#define virtual_mcu_ConsolePrint__M
#include "../../virtual.mcu/ConsolePrint/ConsolePrint.h"
#endif

#ifndef pollen_event_Events__M
#define pollen_event_Events__M
#include "../../pollen.event/Events/Events.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test69_Test_12__M
#define test69_Test_12__M
#include "../../test69/Test_12/Test_12.h"
#endif


/*
 * ======== target data definitions (unit ConsolePrint) ========
 */

struct virtual_mcu_ConsolePrint_ virtual_mcu_ConsolePrint = { /* module data */
    "[95m",                 /* HEADER */
    "[94m",                 /* OKBLUE */
    "[92m",                 /* OKGREEN */
    "[93m",                 /* WARNING */
    "[91m",                 /* FAIL */
    "[0m",                  /* ENDC */
};

/*
 * ======== target data definitions (unit Events) ========
 */

struct pollen_event_Events_ pollen_event_Events = { /* module data */
    (uint8)0x1,              /* numEvents */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit Test_12) ========
 */

test69_Test_12_e__TYPE test69_Test_12_e__V = /* pollen.event.Events.Event object init */
{
    test69_Test_12_tick__I,    /* handler */
};

/*
 * ======== target data definitions (unit Test_12) ========
 */

struct test69_Test_12_ test69_Test_12 = { /* module data */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test69_Test_12_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test69_Test_12_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test69_Test_12_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test69_Test_12_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test69_Test_12_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../virtual.mcu/ConsolePrint/ConsolePrint.c"
#include "../../pollen.event/Events/Events.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test69/Test_12/Test_12.c"

/*
 * ======== pollen.reset() ========
 */

void test69_Test_12_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test69_Test_12_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test69_Test_12_pollen__reset__E();
    virtual_mcu_ConsolePrint_targetInit__I();
    pollen_event_Events_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test69_Test_12_targetInit__I();
    test69_Test_12_pollen__ready__E();
    test69_Test_12_pollen__run__E();
    test69_Test_12_pollen__shutdown__E(0);
}
