#include <std.h>


/*
 * ======== protocol member test70.QueueBug_01.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef pollen_data_HandlerQueue__M
#define pollen_data_HandlerQueue__M
#include "../../pollen.data/HandlerQueue/HandlerQueue.h"
#endif

#ifndef virtual_mcu_ConsolePrint__M
#define virtual_mcu_ConsolePrint__M
#include "../../virtual.mcu/ConsolePrint/ConsolePrint.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test70_QueueBug_01__M
#define test70_QueueBug_01__M
#include "../../test70/QueueBug_01/QueueBug_01.h"
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
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== host data definitions (unit QueueBug_01) ========
 */

test70_QueueBug_01_eventHandlers__TYPE test70_QueueBug_01_eventHandlers__V = /* pollen.data.HandlerQueue object init */
{
    (const uint8)0xa,    /* capacity */
    {
        null,  /* [0] */
        null,  /* [1] */
        null,  /* [2] */
        null,  /* [3] */
        null,  /* [4] */
        null,  /* [5] */
        null,  /* [6] */
        null,  /* [7] */
        null,  /* [8] */
        null,  /* [9] */
    },    /* elements */
    (uint8)0x0,              /* length */
    (uint8)0x0,              /* head */
    (uint8)0x0,              /* tail */
    (uint8)0x5,              /* maxLength */
};

/*
 * ======== target data definitions (unit QueueBug_01) ========
 */

struct test70_QueueBug_01_ test70_QueueBug_01 = { /* module data */
    null,                    /* h */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test70_QueueBug_01_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test70_QueueBug_01_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test70_QueueBug_01_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test70_QueueBug_01_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test70_QueueBug_01_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../pollen.data/HandlerQueue/HandlerQueue.c"
#include "../../virtual.mcu/ConsolePrint/ConsolePrint.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test70/QueueBug_01/QueueBug_01.c"

/*
 * ======== pollen.reset() ========
 */

void test70_QueueBug_01_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test70_QueueBug_01_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test70_QueueBug_01_pollen__reset__E();
    virtual_mcu_ConsolePrint_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test70_QueueBug_01_targetInit__I();
    test70_QueueBug_01_pollen__ready__E();
    test70_QueueBug_01_pollen__run__E();
    test70_QueueBug_01_pollen__shutdown__E(0);
}
