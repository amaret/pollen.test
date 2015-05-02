#include <std.h>


/*
 * ======== protocol member test78.FakeLed.pin delegates test78_FakePin ========
 */

#ifndef test78_FakePin__M
#define test78_FakePin__M
#include "../../test78/FakePin/FakePin.h"
#endif


/*
 * ======== protocol member test78.HostCallThruProtoBug.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef test78_FakePin__M
#define test78_FakePin__M
#include "../../test78/FakePin/FakePin.h"
#endif

#ifndef test78_FakeLed__M
#define test78_FakeLed__M
#include "../../test78/FakeLed/FakeLed.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test78_HostCallThruProtoBug__M
#define test78_HostCallThruProtoBug__M
#include "../../test78/HostCallThruProtoBug/HostCallThruProtoBug.h"
#endif


/*
 * ======== target data definitions (unit FakePin) ========
 */

struct test78_FakePin_ test78_FakePin = { /* module data */
};

/*
 * ======== target data definitions (unit FakeLed) ========
 */

struct test78_FakeLed_ test78_FakeLed = { /* module data */
    &test78_FakePin,         /* pin */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit HostCallThruProtoBug) ========
 */

struct test78_HostCallThruProtoBug_ test78_HostCallThruProtoBug = { /* module data */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test78_HostCallThruProtoBug_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test78_HostCallThruProtoBug_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test78_HostCallThruProtoBug_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test78_HostCallThruProtoBug_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test78_HostCallThruProtoBug_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../test78/FakePin/FakePin.c"
#include "../../test78/FakeLed/FakeLed.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test78/HostCallThruProtoBug/HostCallThruProtoBug.c"

/*
 * ======== pollen.reset() ========
 */

void test78_HostCallThruProtoBug_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test78_HostCallThruProtoBug_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    test78_HostCallThruProtoBug_pollen__reset__E();
    test78_FakePin_targetInit__I();
    test78_FakeLed_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test78_HostCallThruProtoBug_targetInit__I();
    test78_HostCallThruProtoBug_pollen__ready__E();
    test78_HostCallThruProtoBug_pollen__run__E();
    test78_HostCallThruProtoBug_pollen__shutdown__E(0);
}
