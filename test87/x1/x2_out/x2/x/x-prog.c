#include <std.h>


/*
 * ======== unit headers ========
 */

#ifndef yy_z__M
#define yy_z__M
#include "../../yy/z/z.h"
#endif

#ifndef x2_x__M
#define x2_x__M
#include "../../x2/x/x.h"
#endif


/*
 * ======== target data definitions (unit z) ========
 */

struct yy_z_ yy_z = { /* module data */
};

/*
 * ======== target data definitions (unit x) ========
 */

struct x2_x_ x2_x = { /* module data */
};

/*
 * ======== pollen.print ========
 */

void x2_x_pollen__printBool(bool b) {
}
void x2_x_pollen__printInt(int32 i) {
}
void x2_x_pollen__printUint(uint32 u) {
}
void x2_x_pollen__printStr(string s) {
}

/*
 * ======== module functions ========
 */

#include "../../yy/z/z.c"
#include "../../x2/x/x.c"

/*
 * ======== pollen.reset() ========
 */

void x2_x_pollen__reset__E() {
    /* empty default */
}

/*
 * ======== pollen.ready() ========
 */

void x2_x_pollen__ready__E() {
    /* empty default */
}

/*
 * ======== pollen.shutdown(uint8 id) ========
 */

void x2_x_pollen__shutdown__E() {
    volatile int dummy = 0xCAFE;
    while (dummy) ;
}

/*
 * ======== pollen.wake(uint8 id) ========
 */

void x2_x_pollen__wake__E(byte id) {
    /* empty default */
}

/*
 * ======== pollen.hibernate(uint8 id) ========
 */

void x2_x_pollen__hibernate__E(byte id) {
    /* empty default */
}

/*
 * ======== main() ========
 */

int main() {
    x2_x_pollen__reset__E();
    yy_z_targetInit__I();
    x2_x_targetInit__I();
    x2_x_pollen__ready__E();
    x2_x_pollen__run__E();
    x2_x_pollen__shutdown__E();
}
