#include <std.h>


/*
 * ======== protocol member test93.Mod1.pollenPrintProxy delegates test54_PrintImpl ========
 */

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif


/*
 * ======== unit headers ========
 */

#ifndef pollen_text_Text__M
#define pollen_text_Text__M
#include "../../pollen.text/Text/Text.h"
#endif

#ifndef test54_PrintImpl__M
#define test54_PrintImpl__M
#include "../../test54/PrintImpl/PrintImpl.h"
#endif

#ifndef test93_Mod1__M
#define test93_Mod1__M
#include "../../test93/Mod1/Mod1.h"
#endif


/*
 * ======== target data definitions (unit Text) ========
 */

struct pollen_text_Text_ pollen_text_Text = { /* module data */
};

/*
 * ======== target data definitions (unit PrintImpl) ========
 */

struct test54_PrintImpl_ test54_PrintImpl = { /* module data */
};

/*
 * ======== target data definitions (unit Mod1) ========
 */

struct test93_Mod1_ test93_Mod1 = { /* module data */
    "xxx1",                  /* s1 */
    "xyz1",                  /* s2 */
    &test54_PrintImpl,    /* pollenPrintProxy */
};

/*
 * ======== pollen print ========
 */

void test93_Mod1_pollen__printBool(bool b) {
    test54_PrintImpl_printBool__E(b);
}
void test93_Mod1_pollen__printInt(int32 i) {
    test54_PrintImpl_printInt__E(i);
}
void test93_Mod1_pollen__printReal(float f) {
    test54_PrintImpl_printReal__E(f);
}
void test93_Mod1_pollen__printUint(uint32 u) {
    test54_PrintImpl_printUint__E(u);
}
void test93_Mod1_pollen__printStr(string s) {
    test54_PrintImpl_printStr__E(s);
}

/*
 * ======== module functions ========
 */

#include "../../pollen.text/Text/Text.c"
#include "../../test54/PrintImpl/PrintImpl.c"
#include "../../test93/Mod1/Mod1.c"

/*
 * ======== pollen.reset() ========
 */

void test93_Mod1_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void test93_Mod1_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8) ========
 */

void test93_Mod1_pollen__shutdown__E(uint8 i) {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== main() ========
 */

int main() {
    test93_Mod1_pollen__reset__E();
    pollen_text_Text_targetInit__I();
    test54_PrintImpl_targetInit__I();
    test93_Mod1_targetInit__I();
    test93_Mod1_pollen__ready__E();
    test93_Mod1_pollen__run__E();
    test93_Mod1_pollen__shutdown__E(0);
}
